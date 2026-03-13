# Design Patterns (Bloc/Cubit)

Common patterns for robust Flutter applications using `flutter_bloc`.

## 1. Bloc for Complex Flows

Use Bloc when logic involves many events and transitions.

```dart
sealed class PaymentEvent {
  const PaymentEvent();
}

final class PaymentStarted extends PaymentEvent {
  const PaymentStarted();
}

@immutable
sealed class PaymentState {
  const PaymentState();
}

final class PaymentIdle extends PaymentState {
  const PaymentIdle();
}

final class PaymentLoading extends PaymentState {
  const PaymentLoading();
}

final class PaymentSuccess extends PaymentState {
  const PaymentSuccess();
}

final class PaymentFailure extends PaymentState {
  const PaymentFailure(this.message);

  final String message;
}
```

## 2. Cubit for Simple Flows

Use Cubit when state transitions are small and direct.

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```

## 3. Sealed States Instead of Freezed (Base Examples)

Prefer plain sealed classes in this skill examples.

Benefits:
- No code-generation dependency for baseline architecture examples.
- Clear Dart-native state modeling.
- Easy onboarding for teams.

## 4. Repository as SSOT

```dart
class PromoRepository {
  PromoRepository(this._service);

  final PromoService _service;

  Future<Result<PromoData>> load() async {
    try {
      final dto = await _service.fetchPromoData();
      return Result.ok(PromoData.fromDto(dto));
    } catch (e) {
      return Result.error(Exception('Failed to load promo data: $e'));
    }
  }
}
```

## 5. UI Switch by State

```dart
BlocBuilder<PromoSummaryCubit, PromoSummaryState>(
  builder: (context, state) {
    return switch (state) {
      PromoSummaryLoading() => const CircularProgressIndicator(),
      PromoSummaryLoadSuccess() => Text(state.title),
      PromoSummaryLoadError() => const Text('Error'),
    };
  },
)
```

## 6. Practical Rule

- Complex flow: Bloc.
- Simple flow: Cubit.
- Avoid ViewModels in new code and examples.
