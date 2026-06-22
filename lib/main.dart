import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/data/api/about_author_api_controller.dart';
import 'package:web_art_galery/src/features/about_author/data/repository/about_author_repository_firebase.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/onboarding_tour_cubit.dart';
import 'package:web_art_galery/src/features/archive/data/repository/archive_repository_local.dart';
import 'package:web_art_galery/src/features/archive/presentation/cubits/archive_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/api/catalog_of_works_api_controller.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/repository/catalog_of_works_repository_firebase.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/films/data/repository/films_repository_local.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/news/data/api/news_api_controller.dart';
import 'package:web_art_galery/src/features/news/data/repository/news_repository_firebase.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_router.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
import 'package:web_art_galery/src/shared/config/app_version.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_bootstrap.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/platform/page_title/page_title.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

void main() {
  usePathUrlStrategy();
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Each init step is isolated and time-boxed so a single failure (most
      // commonly IndexedDB on iOS Safari with strict ITP/private mode) cannot
      // prevent runApp() from being called.
      //
      // HydratedBloc and Firebase failures are captured here and re-emitted as
      // dedicated `hydrated_bloc_error` / `firebase_error` analytics events
      // *after* telemetry initialises (telemetry depends on Firebase, so it
      // can't be the receiver during these steps). If Firebase fully fails,
      // telemetry never enables and the deferred `firebase_error` event won't
      // transmit — local AppLogger.w still fires so the failure is diagnosable.
      ({Object error, StackTrace stack})? deferredHydratedBlocError;
      ({Object error, StackTrace stack})? deferredFirebaseError;

      try {
        HydratedBloc.storage = await HydratedStorage.build(
          storageDirectory: HydratedStorageDirectory.web,
        ).timeout(const Duration(seconds: 5));
      } catch (e, s) {
        AppLogger.instance.w(
          'HydratedBloc storage unavailable, falling back to in-memory',
          error: e,
          stackTrace: s,
        );
        HydratedBloc.storage = _InMemoryStorage();
        deferredHydratedBlocError = (error: e, stack: s);
      }

      FlutterError.onError = (details) {
        AppLogger.instance.e(
          'Flutter framework error',
          error: details.exception,
          stackTrace: details.stack,
        );
        AppTelemetry.instance.logFatal(details.exception, details.stack, reason: 'flutter_error');
        Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.current);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        AppLogger.instance.f('Platform dispatcher error', error: error, stackTrace: stack);
        AppTelemetry.instance.logFatal(error, stack, reason: 'platform_dispatcher');
        return true;
      };

      bool firebaseReady = false;
      try {
        firebaseReady = await FirebaseBootstrap.tryInitialize().timeout(const Duration(seconds: 8));
      } catch (e, s) {
        AppLogger.instance.w('Firebase init failed, continuing without', error: e, stackTrace: s);
        deferredFirebaseError = (error: e, stack: s);
      }

      // Guarded: MetaSEO touches document/web APIs and must never be able to
      // throw synchronously here — a throw before runApp() leaves the page
      // stuck on the loading splash forever (the zone catches it, but the app
      // never starts). SEO meta tags are non-critical, so swallow + log.
      if (kIsWeb) {
        try {
          MetaSEO().config();
        } catch (e, s) {
          AppLogger.instance.w('MetaSEO config failed, continuing', error: e, stackTrace: s);
        }
      }

      // Resolve the browser/device locale for the first synchronous frame (page
      // title etc.). AppLocaleCubit then restores any saved choice and re-applies
      // it on construction, so a returning user's selection still wins.
      await LocaleSettings.setLocale(AppLocaleUtils.findDeviceLocale());

      setPageTitle(t.app.title);
      LocaleSettings.getLocaleStream().listen((_) {
        setPageTitle(t.app.title);
      });

      runApp(
        TranslationProvider(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AppLocaleCubit>(create: (_) => AppLocaleCubit()),
              // Feature cubits are PROVIDED here but NOT loaded here. Each page
              // triggers its own cubit's load() on mount (via CubitInitializer
              // or page initState), so nothing fetches over the network until
              // its route is actually visited. This keeps the first route
              // (/about-author) from firing the news + catalog Firestore
              // queries it never displays. The providers stay app-wide because
              // the shell reads news/catalog state to show/hide their nav tabs.
              BlocProvider<NewsListCubit>(
                create: (_) => NewsListCubit(
                  repository: NewsRepositoryFirebase(apiController: NewsApiController()),
                ),
              ),
              BlocProvider<OnboardingTourCubit>(create: (_) => OnboardingTourCubit()),
              BlocProvider<AboutAuthorCubit>(
                create: (_) => AboutAuthorCubit(
                  repository: AboutAuthorRepositoryFirebase(
                    apiController: AboutAuthorApiController(),
                  ),
                ),
              ),
              BlocProvider<CatalogOfWorksCubit>(
                create: (_) => CatalogOfWorksCubit(
                  repository: CatalogOfWorksRepositoryFirebase(
                    apiController: CatalogOfWorksApiController(),
                  ),
                ),
              ),
              BlocProvider<FilmsCubit>(
                create: (_) => FilmsCubit(repository: const FilmsRepositoryLocal()),
              ),
              BlocProvider<ArchiveCubit>(
                create: (_) => ArchiveCubit(repository: const ArchiveRepositoryLocal()),
              ),
            ],
            child: const ArtGalleryApp(),
          ),
        ),
      );

      // Telemetry init does network / platform-channel work that the first
      // frame never needs, so it runs *after* runApp instead of blocking paint.
      // Deferred Firebase / HydratedBloc errors captured above are flushed once
      // telemetry is ready (telemetry depends on Firebase, so it can't be the
      // receiver during the init steps).
      unawaited(
        _initTelemetry(
          firebaseReady: firebaseReady,
          deferredHydratedBlocError: deferredHydratedBlocError,
          deferredFirebaseError: deferredFirebaseError,
        ),
      );

      _setDeviceFormFactorUserProperties();
    },
    (error, stackTrace) {
      AppLogger.instance.f('Uncaught bootstrap zone error', error: error, stackTrace: stackTrace);
      AppTelemetry.instance.logFatal(error, stackTrace, reason: 'zone_uncaught');
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'art_gallery.bootstrap',
          context: ErrorDescription('while starting app zone'),
        ),
      );
    },
  );
}

/// Initializes telemetry off the first-frame critical path and, once it is
/// ready, flushes any Firebase / HydratedBloc errors deferred during bootstrap.
Future<void> _initTelemetry({
  required bool firebaseReady,
  required ({Object error, StackTrace stack})? deferredHydratedBlocError,
  required ({Object error, StackTrace stack})? deferredFirebaseError,
}) async {
  try {
    await AppTelemetry.instance.initialize().timeout(const Duration(seconds: 5));
  } catch (e, s) {
    AppLogger.instance.w('Telemetry init failed, continuing without', error: e, stackTrace: s);
  }

  if (deferredHydratedBlocError != null) {
    unawaited(
      AppTelemetry.instance.logHydratedBlocError(
        deferredHydratedBlocError.error,
        deferredHydratedBlocError.stack,
      ),
    );
  }
  if (deferredFirebaseError != null) {
    unawaited(
      AppTelemetry.instance.logFirebaseError(
        deferredFirebaseError.error,
        deferredFirebaseError.stack,
      ),
    );
  } else if (!firebaseReady) {
    unawaited(
      AppTelemetry.instance.logFirebaseError(
        StateError('Firebase not configured'),
        StackTrace.current,
        reason: 'tryInitialize_returned_false',
      ),
    );
  }
}

void _setDeviceFormFactorUserProperties() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final locale = LocaleSettings.currentLocale.languageCode;
    AppTelemetry.instance.setUserProperty('is_web', 'true');
    AppTelemetry.instance.setUserProperty('app_version', AppVersion.current);
    AppTelemetry.instance.setUserProperty('app_locale', locale);
    AppTelemetry.instance.logEvent(
      'app_open',
      params: {
        'version': AppVersion.current,
        'locale': locale,
      },
    );

    final view = WidgetsBinding.instance.platformDispatcher.views.isNotEmpty
        ? WidgetsBinding.instance.platformDispatcher.views.first
        : null;
    if (view == null) {
      return;
    }
    final logicalWidth = view.physicalSize.width / view.devicePixelRatio;
    final formFactor = _classifyFormFactor(logicalWidth);
    AppTelemetry.instance.setUserProperty('device_form_factor', formFactor);
  });
}

String _classifyFormFactor(double logicalWidth) {
  if (logicalWidth < KSize.adaptiveCompactBreakpoint) {
    return 'mobile_web';
  }
  if (logicalWidth < KSize.adaptiveExpandedBreakpoint) {
    return 'tablet_web';
  }
  return 'desktop_web';
}

class ArtGalleryApp extends StatelessWidget {
  const ArtGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: t.app.title,
      routerConfig: appRouter,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: AppTheme.light,
    );
  }
}

/// Volatile fallback for [HydratedBloc.storage] used when the platform's
/// IndexedDB is unavailable (iOS Safari private mode, strict ITP, blocked
/// cookies). State persists for the current session only.
class _InMemoryStorage implements Storage {
  final Map<String, dynamic> _store = {};

  @override
  dynamic read(String key) => _store[key];

  @override
  Future<void> write(String key, dynamic value) async {
    _store[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _store.remove(key);
  }

  @override
  Future<void> clear() async {
    _store.clear();
  }

  @override
  Future<void> close() async {
    _store.clear();
  }
}
