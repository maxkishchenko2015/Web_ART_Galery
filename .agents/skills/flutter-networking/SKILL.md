---
name: flutter-networking
description: Comprehensive Flutter networking guidance using Dio and Retrofit for typed REST APIs, authentication interceptors, robust error handling, and performance optimization. Use when implementing GET POST PUT DELETE requests, retries, token refresh flows, background parsing, or network architecture in Flutter apps.
metadata:
  author: Maxkishchenko
  version: "1.1"
---

# Flutter Networking

## Quick Start

Add Dio + Retrofit dependencies to `pubspec.yaml`:

```yaml
dependencies:
  dio: ^5.9.2
  retrofit: ^4.9.2
  json_annotation: ^4.9.0

dev_dependencies:
  retrofit_generator: ^10.0.1
  build_runner: ^2.6.0
  json_serializable: ^6.10.0
```

Define Retrofit API contract:

```dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'album_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class AlbumApi {
  factory AlbumApi(Dio dio, {String? baseUrl}) = _AlbumApi;

  @GET('/albums/{id}')
  Future<Album> getAlbum(@Path('id') int id);

  @POST('/albums')
  Future<Album> createAlbum(@Body() CreateAlbumRequest body);
}
```

Configure Dio once:

```dart
final dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json'},
  ),
);

final api = AlbumApi(dio);
```

Generate Retrofit client implementation:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## HTTP Methods

### GET - Fetch Data

Use typed Retrofit methods for read operations. See [http-basics.md](references/http-basics.md).

### POST - Create Data

Use `@POST` with DTO body classes and generated serialization.

### PUT/PATCH - Update Data

Use `@PUT` / `@PATCH` on Retrofit interface methods with typed request models.

### DELETE - Remove Data

Use `@DELETE` for typed delete endpoints and return `Future<void>` when no payload is expected.

## WebSocket

Use `web_socket_channel` for realtime streams; keep HTTP API traffic in Dio/Retrofit. See [websockets.md](references/websockets.md).

## Authentication

Use Dio interceptors to inject tokens and handle refresh flow centrally.

```dart
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._tokenStore);

  final TokenStore _tokenStore;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.readAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

See [authentication.md](references/authentication.md) for full token refresh flow.

## Error Handling

Map `DioException` to domain exceptions in one place.

```dart
Never mapDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw RequestTimeoutException();
    case DioExceptionType.badResponse:
      final code = e.response?.statusCode ?? -1;
      if (code == 401) throw UnauthorizedException();
      if (code == 404) throw NotFoundException();
      if (code >= 500) throw ServerException();
      throw ApiException(code: code);
    case DioExceptionType.cancel:
      throw RequestCancelledException();
    default:
      throw NetworkException();
  }
}
```

See [error-handling.md](references/error-handling.md).

## Performance

### Background Parsing with Isolates

For large JSON payloads, prefer Retrofit with `Parser.FlutterCompute` or parse in `compute()`.

```dart
@RestApi(
  baseUrl: 'https://api.example.com',
  parser: Parser.FlutterCompute,
)
abstract class PhotoApi {
  factory PhotoApi(Dio dio, {String? baseUrl}) = _PhotoApi;

  @GET('/photos')
  Future<List<Photo>> getPhotos();
}
```

See [performance.md](references/performance.md).

## Integration with Architecture

When using MVVM architecture (see [flutter-architecture](../flutter-architecture/)):

1. Service/API Layer: Retrofit interfaces (`@RestApi`) and Dio configuration.
2. Repository Layer: Aggregate API + cache, map DTOs to domain models.
3. ViewModel Layer: Expose UI state and trigger use cases.

Example repository:

```dart
class AlbumRepository {
  AlbumRepository(this._api, this._cache);

  final AlbumApi _api;
  final AlbumCache _cache;

  Future<Album> getAlbum(int id) async {
    final cached = await _cache.get(id);
    if (cached != null) return cached;

    final album = await _api.getAlbum(id);
    await _cache.put(album);
    return album;
  }
}
```

## Common Patterns

### Retry Logic

Implement retry in a Dio interceptor for idempotent requests.

```dart
class RetryInterceptor extends Interceptor {
  RetryInterceptor({this.maxRetries = 3});

  final int maxRetries;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final attempt = (request.extra['retry_attempt'] as int?) ?? 0;

    if (attempt >= maxRetries || request.method == 'POST') {
      return handler.next(err);
    }

    request.extra['retry_attempt'] = attempt + 1;
    await Future<void>.delayed(Duration(milliseconds: 300 * (attempt + 1)));

    final response = await Dio().fetch(request);
    handler.resolve(response);
  }
}
```

## Best Practices

### DO

- Use one shared `Dio` instance per backend.
- Use Retrofit contracts for typed APIs.
- Keep DTO serialization in `json_serializable` models.
- Handle auth and retries in interceptors, not UI widgets.
- Convert `DioException` to app-specific failures in repositories.

### DON'T

- Create `Dio()` per request.
- Mix low-level networking code in widgets.
- Parse large responses on UI thread.
- Duplicate header/token logic across services.
- Ignore cancellation support for long-running requests.
