# Authentication with Dio + Retrofit

## Overview

Use a `QueuedInterceptor` to add auth headers and coordinate token refresh.

## Dependencies

```yaml
dependencies:
  dio: ^5.9.2
  retrofit: ^4.9.2
  flutter_secure_storage: ^10.0.0
```

## Token Storage

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStore {
  TokenStore(this._storage);

  final FlutterSecureStorage _storage;

  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  Future<String?> readAccessToken() => _storage.read(key: _accessKey);
  Future<String?> readRefreshToken() => _storage.read(key: _refreshKey);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessKey, value: accessToken);
    await _storage.write(key: _refreshKey, value: refreshToken);
  }

  Future<void> clear() async {
    await _storage.delete(key: _accessKey);
    await _storage.delete(key: _refreshKey);
  }
}
```

## Auth Interceptor

```dart
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.dio,
    required this.tokenStore,
  });

  final Dio dio;
  final TokenStore tokenStore;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenStore.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await tokenStore.readRefreshToken();
    if (refreshToken == null) {
      await tokenStore.clear();
      return handler.next(err);
    }

    try {
      final refreshResponse = await dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final newAccess = refreshResponse.data?['accessToken'] as String;
      final newRefresh = refreshResponse.data?['refreshToken'] as String;

      await tokenStore.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      final request = err.requestOptions;
      request.headers['Authorization'] = 'Bearer $newAccess';

      final replay = await dio.fetch<dynamic>(request);
      handler.resolve(replay);
    } on DioException {
      await tokenStore.clear();
      handler.next(err);
    }
  }
}
```

## Retrofit API Contract

```dart
@RestApi(baseUrl: 'https://api.example.com')
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @GET('/me')
  Future<UserProfile> getProfile();
}
```

## Dio Wiring

```dart
final dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
final tokenStore = TokenStore(const FlutterSecureStorage());
dio.interceptors.add(AuthInterceptor(dio: dio, tokenStore: tokenStore));

final userApi = UserApi(dio);
```

## Best Practices

- Keep refresh logic in one interceptor.
- Use `QueuedInterceptor` to avoid parallel refresh races.
- Keep retry attempts bounded.
- Clear credentials on unrecoverable 401 responses.
- Do not store tokens in plain-text local storage.
