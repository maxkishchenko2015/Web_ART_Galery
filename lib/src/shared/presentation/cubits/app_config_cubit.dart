import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/shared/config/remote_config/app_remote_config.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Site configuration (default theme, featured paintings, news announcements).
/// Starts with the bundled fallback and switches to Remote Config values once
/// they're fetched.
class AppConfigCubit extends Cubit<AppRemoteConfig> {
  AppConfigCubit({required AppRemoteConfig initial}) : super(initial);

  void apply(AppRemoteConfig config) {
    AppTelemetry.instance.logEvent(
      'remote_config_applied',
      params: {
        'source': config.source.name,
        'theme': config.themeCode,
        'pictures_count': config.pictureIds.length,
        'news_count': config.announcements.length,
      },
    );
    AppTelemetry.instance.setUserProperty('config_source', config.source.name);
    if (config != state) emit(config);
  }
}
