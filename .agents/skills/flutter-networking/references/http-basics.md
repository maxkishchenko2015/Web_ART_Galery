# Dio + Retrofit Basics

## Overview

Use `dio` as the HTTP engine and `retrofit` for typed API contracts.

## Dependencies

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

## Retrofit Setup

```dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.example.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/albums/{id}')
  Future<AlbumDto> getAlbum(@Path('id') int id);

  @GET('/albums')
  Future<List<AlbumDto>> getAlbums(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @POST('/albums')
  Future<AlbumDto> createAlbum(@Body() CreateAlbumRequest request);

  @PUT('/albums/{id}')
  Future<AlbumDto> updateAlbum(
    @Path('id') int id,
    @Body() UpdateAlbumRequest request,
  );

  @DELETE('/albums/{id}')
  Future<void> deleteAlbum(@Path('id') int id);
}
```

Generate client code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Dio Configuration

```dart
Dio buildDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: const {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: false));
  return dio;
}
```

## Direct Dio Request (when needed)

```dart
final dio = Dio();

final response = await dio.get(
  '/search',
  queryParameters: {'q': 'flutter', 'page': 1},
);

final data = response.data as Map<String, dynamic>;
```

## Upload with Dio

```dart
final formData = FormData.fromMap({
  'name': 'profile image',
  'file': await MultipartFile.fromFile(
    '/tmp/avatar.jpg',
    filename: 'avatar.jpg',
  ),
});

await dio.post('/upload', data: formData);
```

## Retrofit + HttpResponse metadata

```dart
@GET('/albums/{id}')
Future<HttpResponse<AlbumDto>> getAlbumWithMeta(@Path('id') int id);
```

```dart
final result = await api.getAlbumWithMeta(1);
final album = result.data;
final status = result.response.statusCode;
```
