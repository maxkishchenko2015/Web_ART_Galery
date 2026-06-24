# Performance with Dio + Retrofit

## Overview

Use one Dio instance, parser offloading, request deduplication, and efficient pagination.

## Shared Dio Instance

```dart
class ApiClientFactory {
  ApiClientFactory._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
```

## Parse on Background Isolate

```dart
@RestApi(
  baseUrl: 'https://api.example.com',
  parser: Parser.FlutterCompute,
)
abstract class PhotoApi {
  factory PhotoApi(Dio dio, {String? baseUrl}) = _PhotoApi;

  @GET('/photos')
  Future<List<PhotoDto>> getPhotos();
}
```

Use `Parser.FlutterCompute` when payload size is large and parsing can cause jank.

## Request Deduplication

```dart
class RequestDeduplicator<T> {
  final Map<String, Future<T>> _inFlight = <String, Future<T>>{};

  Future<T> run(String key, Future<T> Function() action) {
    final existing = _inFlight[key];
    if (existing != null) return existing;

    final future = action();
    _inFlight[key] = future;

    return future.whenComplete(() => _inFlight.remove(key));
  }
}
```

## Pagination

```dart
@RestApi(baseUrl: 'https://api.example.com')
abstract class FeedApi {
  factory FeedApi(Dio dio, {String? baseUrl}) = _FeedApi;

  @GET('/items')
  Future<PageDto<ItemDto>> getItems(
    @Query('cursor') String? cursor,
    @Query('limit') int limit,
  );
}
```

Keep only one pagination request active per list to avoid racing responses.

## Smart Retry

```dart
class RetryInterceptor extends Interceptor {
  RetryInterceptor({this.maxRetries = 2});

  final int maxRetries;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final isIdempotent = request.method == 'GET' || request.method == 'HEAD';
    final attempt = (request.extra['retry_attempt'] as int?) ?? 0;

    if (!isIdempotent || attempt >= maxRetries) {
      return handler.next(err);
    }

    request.extra['retry_attempt'] = attempt + 1;
    await Future<void>.delayed(Duration(milliseconds: 250 * (attempt + 1)));

    final dio = Dio();
    final response = await dio.fetch<dynamic>(request);
    handler.resolve(response);
  }
}
```

## Caching Notes

- Honor server cache headers (`ETag`, `Cache-Control`) when available.
- Cache parsed domain objects instead of raw response maps.
- Use memory cache for short-lived lists and persistent cache for offline reads.
