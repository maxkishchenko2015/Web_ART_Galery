import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_router.dart';
import 'package:web_art_galery/src/shared/config/app_theme.dart';
import 'package:web_art_galery/src/shared/config/firebase/firebase_bootstrap.dart';
import 'package:web_art_galery/src/shared/platform/page_title/page_title.dart';
import 'package:web_art_galery/src/shared/presentation/cubits/app_locale_cubit.dart';
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
        Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.current);
      };

      await FirebaseBootstrap.tryInitialize();

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
            providers: [BlocProvider<AppLocaleCubit>(create: (_) => AppLocaleCubit())],
            child: const ArtGalleryApp(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      AppLogger.instance.f('Uncaught bootstrap zone error', error: error, stackTrace: stackTrace);
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
