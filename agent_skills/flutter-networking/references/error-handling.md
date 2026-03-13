# Error Handling with Dio + Retrofit

## Overview

Catch `DioException`, map it to domain failures, and return UI-safe errors.

## Core Mapping

```dart
sealed class Failure {
  const Failure();
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

class ServerFailure extends Failure {
  const ServerFailure(this.statusCode);

  final int statusCode;
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutFailure();
    case DioExceptionType.badResponse:
      final code = e.response?.statusCode ?? -1;
      if (code == 401) return const UnauthorizedFailure();
      if (code == 404) return const NotFoundFailure();
      return ServerFailure(code);
    case DioExceptionType.cancel:
      return const NetworkFailure();
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return const NetworkFailure();
  }
}
```

## Repository Pattern

```dart
class AlbumRepository {
  AlbumRepository(this._api);

  final AlbumApi _api;

  Future<Result<Album>> getAlbum(int id) async {
    try {
      final data = await _api.getAlbum(id);
      return Result.ok(data);
    } on DioException catch (e) {
      return Result.err(mapDioException(e));
    }
  }
}
```

## Handling Validation Errors

```dart
class ValidationFailure extends Failure {
  const ValidationFailure(this.messages);

  final List<String> messages;
}

Failure mapBadResponse(DioException e) {
  final statusCode = e.response?.statusCode ?? -1;
  final body = e.response?.data;

  if (statusCode == 422 && body is Map<String, dynamic>) {
    final errors = (body['errors'] as List<dynamic>? ?? const <dynamic>[])
        .map((e) => e.toString())
        .toList();
    return ValidationFailure(errors);
  }

  return ServerFailure(statusCode);
}
```

## UI Translation

```dart
String messageForFailure(Failure failure) {
  return switch (failure) {
    TimeoutFailure() => 'Request timed out. Please try again.',
    UnauthorizedFailure() => 'Session expired. Please sign in again.',
    NotFoundFailure() => 'Requested resource was not found.',
    ServerFailure() => 'Server is unavailable. Try again later.',
    ValidationFailure() => 'Please check your input and try again.',
    NetworkFailure() => 'No internet connection.',
    _ => 'Unexpected error.',
  };
}
```

## Best Practices

- Map exceptions only once (repository or dedicated mapper).
- Avoid exposing raw `DioException` in UI.
- Log diagnostics separately from user messages.
- Keep retry decisions based on idempotency and error type.
