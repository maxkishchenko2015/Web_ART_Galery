# Flutter Architecture Examples (Bloc/Cubit)

This directory documents how to use Bloc/Cubit in feature-first architecture.

## Cubit Example

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class PromoSummaryState {
  const PromoSummaryState();
}

final class PromoSummaryLoading extends PromoSummaryState {
  const PromoSummaryLoading();
}

final class PromoSummaryLoadSuccess extends PromoSummaryState {
  const PromoSummaryLoadSuccess({required this.title});

  final String title;
}

final class PromoSummaryLoadError extends PromoSummaryState {
  const PromoSummaryLoadError(this.message);

  final String message;
}

class PromoSummaryCubit extends Cubit<PromoSummaryState> {
  PromoSummaryCubit(this._repository) : super(const PromoSummaryLoading());

  final PromoRepository _repository;

  Future<void> fetchPromoMissions() async {
    emit(const PromoSummaryLoading());
    final result = await _repository.load();
    if (result case Ok()) {
      emit(PromoSummaryLoadSuccess(title: result.value.title));
    } else if (result case Error()) {
      emit(PromoSummaryLoadError(result.error.toString()));
    }
  }
}
```

## Bloc Example (Complex)

```dart
sealed class WalletEvent {
  const WalletEvent();
}

final class WalletLoadRequested extends WalletEvent {
  const WalletLoadRequested();
}

@immutable
sealed class WalletState {
  const WalletState();
}

final class WalletLoading extends WalletState {
  const WalletLoading();
}

final class WalletReady extends WalletState {
  const WalletReady(this.balance);

  final String balance;
}

final class WalletError extends WalletState {
  const WalletError(this.message);

  final String message;
}

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this._repository) : super(const WalletLoading()) {
    on<WalletLoadRequested>(_onLoad);
  }

  final WalletRepository _repository;

  Future<void> _onLoad(
    WalletLoadRequested event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    final result = await _repository.fetchWallet();
    if (result case Ok()) {
      emit(WalletReady(result.value.balance));
    } else if (result case Error()) {
      emit(WalletError(result.error.toString()));
    }
  }
}
```

## UI Wiring

```dart
BlocProvider<PromoSummaryCubit>(
  create: (_) => PromoSummaryCubit(repository)..fetchPromoMissions(),
  child: BlocBuilder<PromoSummaryCubit, PromoSummaryState>(
    builder: (context, state) {
      return switch (state) {
        PromoSummaryLoading() => const CircularProgressIndicator(),
        PromoSummaryLoadSuccess() => Text(state.title),
        PromoSummaryLoadError() => const Text('Failed to load'),
      };
    },
  ),
)
```

## Rules for Examples

- No ViewModel examples.
- No Freezed requirement in base examples.
- Use sealed classes for state/event modeling.
- Use Bloc for complex, Cubit for simple flows.
