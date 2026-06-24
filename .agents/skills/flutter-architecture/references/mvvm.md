# Bloc and Cubit Pattern (Legacy Filename)

This file keeps its legacy name for compatibility, but the recommended approach is:

- Use **Bloc** for complex event-driven logic.
- Use **Cubit** for simple state transitions.
- Use **sealed classes** for states/events in examples.
- Do **not** require Freezed in base examples.

## Overview

The presentation layer should be state-driven and predictable:

- UI renders current state.
- UI sends user intents to Bloc/Cubit.
- Bloc/Cubit orchestrates repositories/use-cases.
- Bloc/Cubit emits new immutable state.

## When to use Bloc vs Cubit

### Use Bloc for complex logic

- Multiple event types.
- Branch-heavy business flows.
- Retries, pagination, timers, analytics.
- Side-effects with strict sequencing.

### Use Cubit for simple logic

- Small state machines.
- Straightforward load/update/refresh flows.
- Minimal branching and fewer events.

## Sealed State Example (No Freezed)

```dart
import 'package:flutter/foundation.dart';

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
```

## Cubit Example

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoSummaryCubit extends Cubit<PromoSummaryState> {
  PromoSummaryCubit(this._repository) : super(const PromoSummaryLoading());

  final PromoRepository _repository;

  Future<void> fetchPromoMissions() async {
    emit(const PromoSummaryLoading());
    final result = await _repository.load();
    result.when(
      success: (data) => emit(PromoSummaryLoadSuccess(title: data.title)),
      failure: (error) => emit(PromoSummaryLoadError(error.toString())),
    );
  }
}
```

## Bloc Example Skeleton

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class LoadCashEvent {
  const LoadCashEvent();
}

final class LoadCashRequested extends LoadCashEvent {
  const LoadCashRequested();
}

@immutable
sealed class LoadCashState {
  const LoadCashState();
}

final class LoadCashLoading extends LoadCashState {
  const LoadCashLoading();
}

final class LoadCashReady extends LoadCashState {
  const LoadCashReady(this.items);

  final List<String> items;
}

final class LoadCashFailure extends LoadCashState {
  const LoadCashFailure(this.message);

  final String message;
}

class LoadCashBloc extends Bloc<LoadCashEvent, LoadCashState> {
  LoadCashBloc(this._repository) : super(const LoadCashLoading()) {
    on<LoadCashRequested>(_onLoad);
  }

  final LoadCashRepository _repository;

  Future<void> _onLoad(
    LoadCashRequested event,
    Emitter<LoadCashState> emit,
  ) async {
    emit(const LoadCashLoading());
    final result = await _repository.fetch();
    if (result.isSuccess) {
      emit(LoadCashReady(result.success));
    } else {
      emit(LoadCashFailure(result.failure.toString()));
    }
  }
}
```

## UI Usage with BlocBuilder

```dart
BlocBuilder<PromoSummaryCubit, PromoSummaryState>(
  builder: (context, state) {
    return switch (state) {
      PromoSummaryLoading() => const CircularProgressIndicator(),
      PromoSummaryLoadSuccess() => Text(state.title),
      PromoSummaryLoadError() => const Text('Failed to load'),
    };
  },
)
```

## Rules

- Never use ViewModel examples in this skill.
- Prefer immutable state classes.
- Keep UI widgets dumb; move logic into Bloc/Cubit.
- Use repositories as SSOT and inject them into Bloc/Cubit.
