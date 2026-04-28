import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/about_author/data/api/about_author_api_controller.dart';
import 'package:web_art_galery/src/features/about_author/data/repository/about_author_repository_firebase.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/about_author_cubit.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/api/catalog_of_works_api_controller.dart';
import 'package:web_art_galery/src/features/catalog_of_works/data/repository/catalog_of_works_repository_firebase.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/data/api/news_api_controller.dart';
import 'package:web_art_galery/src/features/news/data/repository/news_repository_firebase.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_router.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_bootstrap.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/platform/page_title/page_title.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
      );

      FlutterError.onError = (details) {
        AppLogger.instance.e(
          'Flutter framework error',
          error: details.exception,
          stackTrace: details.stack,
        );
        AppTelemetry.instance.logFatal(
          details.exception,
          details.stack,
          reason: 'flutter_error',
        );
        Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.current);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        AppLogger.instance.f(
          'Platform dispatcher error',
          error: error,
          stackTrace: stack,
        );
        AppTelemetry.instance.logFatal(error, stack, reason: 'platform_dispatcher');
        return true;
      };

      await FirebaseBootstrap.tryInitialize();
      await AppTelemetry.instance.initialize();
      _setDeviceFormFactorUserProperties();

      LocaleSettings.setLocaleSync(AppLocale.ru);

      if (kIsWeb) {
        setPageTitle(t.app.title);
        LocaleSettings.getLocaleStream().listen((_) {
          setPageTitle(t.app.title);
        });
      }

      runApp(
        TranslationProvider(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AppLocaleCubit>(create: (_) => AppLocaleCubit()),
              BlocProvider<NewsListCubit>(
                create: (_) => NewsListCubit(
                  repository: NewsRepositoryFirebase(apiController: NewsApiController()),
                )..load(),
              ),
              BlocProvider<AboutAuthorCubit>(
                create: (_) => AboutAuthorCubit(
                  repository: AboutAuthorRepositoryFirebase(
                    apiController: AboutAuthorApiController(),
                  ),
                )..loadPhotos(),
              ),
              BlocProvider<CatalogOfWorksCubit>(
                create: (_) => CatalogOfWorksCubit(
                  repository: CatalogOfWorksRepositoryFirebase(
                    apiController: CatalogOfWorksApiController(),
                  ),
                )..loadInitial(),
              ),
            ],
            child: const ArtGalleryApp(),
          ),
        ),
      );
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

void _setDeviceFormFactorUserProperties() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AppTelemetry.instance.setUserProperty('is_web', kIsWeb ? 'true' : 'false');
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
    return kIsWeb ? 'mobile_web' : 'mobile';
  }
  if (logicalWidth < KSize.adaptiveExpandedBreakpoint) {
    return kIsWeb ? 'tablet_web' : 'tablet';
  }
  return kIsWeb ? 'desktop_web' : 'desktop';
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
