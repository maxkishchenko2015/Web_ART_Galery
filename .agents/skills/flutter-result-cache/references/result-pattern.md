# Result Pattern

Use `Result<V, E>` to model operation outcomes without throwing across architectural boundaries.

## Full Implementation

```dart
sealed class Result<V, E> {
  const Result();

  const factory Result.success(V data) = Success<V, E>;
  const factory Result.failure(E error) = Failure<V, E>;

  bool get isSuccess => switch (this) {
    Success<V, E>() => true,
    Failure<V, E>() => false,
  };

  bool get isFailure => switch (this) {
    Success<V, E>() => false,
    Failure<V, E>() => true,
  };

  Result<NewV, E> map<NewV>(NewV Function(V data) mapper) {
    final result = this;
    switch (result) {
      case Success<V, E>():
        return Success<NewV, E>(mapper(result.value));
      case Failure<V, E>():
        return Failure<NewV, E>(result.value);
    }
  }

  V get success {
    final result = this;
    switch (result) {
      case Success<V, E>():
        return result.value;
      case Failure<V, E>():
        throw StateError('Result is not Success');
    }
  }

  E get failure {
    final result = this;
    switch (result) {
      case Success<V, E>():
        throw StateError('Result is not Failure');
      case Failure<V, E>():
        return result.value;
    }
  }
}

final class Success<V, E> extends Result<V, E> {
  final V value;

  const Success(this.value);
}

final class Failure<V, E> extends Result<V, E> {
  final E value;

  const Failure(this.value);
}
```

## Usage in Repository

```dart
Future<Result<User, DomainError>> getUser() async {
  try {
    final dto = await api.fetchUser();
    return Result.success(User.fromDto(dto));
  } catch (e) {
    return Result.failure(DomainError.network(e.toString()));
  }
}
```

## Usage in Bloc/Cubit

```dart
final result = await repository.getUser();
if (result.isSuccess) {
  emit(UserLoaded(result.success));
} else {
  emit(UserFailed(result.failure));
}
```
