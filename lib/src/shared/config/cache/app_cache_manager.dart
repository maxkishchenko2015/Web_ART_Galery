import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManager extends CacheManager with ImageCacheManager {
  static const _key = 'appImageCache';

  static final AppCacheManager _instance = AppCacheManager._();
  factory AppCacheManager() => _instance;

  AppCacheManager._()
      : super(
          Config(
            _key,
            maxNrOfCacheObjects: 500,
            stalePeriod: const Duration(days: 1),
          ),
        );
}
