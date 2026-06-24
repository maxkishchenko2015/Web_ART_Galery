# HydratedBloc for Web Refresh Persistence

HydratedBloc automatically persists and restores Bloc/Cubit state, including after browser refresh.

## Setup

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const App());
}
```

## HydratedCubit example

```dart
class CounterCubit extends HydratedCubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  int fromJson(Map<String, dynamic> json) => json['value'] as int;

  @override
  Map<String, int> toJson(int state) => {'value': state};

  @override
  String get storagePrefix => 'CounterCubit';
}
```

## Why `storagePrefix` matters on web

Avoid relying on `runtimeType` for persisted keys in production web builds where minification/obfuscation can change runtime names.

## HydratedMixin alternative

If using `HydratedMixin`, call `hydrate()` in constructor/init path.

## Error handling

```dart
hydrate(
  onError: (error, stackTrace) {
    return HydrationErrorBehavior.retain;
  },
);
```

## Testing

- Stub `Storage` with `mocktail`.
- Set `HydratedBloc.storage = mockedStorage` in `setUp`.
- Seed cached state via `storage.read(...)` in test cases.
