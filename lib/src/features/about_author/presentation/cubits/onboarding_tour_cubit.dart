import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Step indices of the first-visit onboarding tour on the about-author page.
abstract final class OnboardingTourSteps {
  const OnboardingTourSteps._();

  /// "Tapestry of the Century" photo — scale / dimensions.
  static const int tapestryScale = 0;

  /// "Chernobyl" tapestry photo — gifted to the UN headquarters.
  static const int chernobyl = 1;

  static const int count = 2;
}

class OnboardingTourState {
  const OnboardingTourState({required this.completed, this.activeStep});

  /// Whether the tour was already shown (persisted across sessions).
  final bool completed;

  /// Tooltip step currently on screen, or null when the tour is not running.
  final int? activeStep;

  bool get isActive => activeStep != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is OnboardingTourState &&
        other.completed == completed &&
        other.activeStep == activeStep;
  }

  @override
  int get hashCode => Object.hash(completed, activeStep);
}

/// Drives the one-time guided tour over the "Tapestry of the Century" and
/// "Chernobyl" biography sections.
///
/// Only the [OnboardingTourState.completed] flag is persisted (same
/// HydratedCubit pattern as [AppLocaleCubit]); the running step is volatile,
/// so a reload mid-tour simply restarts it.
class OnboardingTourCubit extends HydratedCubit<OnboardingTourState> {
  OnboardingTourCubit() : super(const OnboardingTourState(completed: false));

  /// Starts the tour. No-op for returning visitors or when already running.
  void start() {
    if (state.completed || state.isActive) {
      return;
    }

    AppTelemetry.instance.logEvent('onboarding_tour_started');
    emit(const OnboardingTourState(completed: false, activeStep: 0));
  }

  /// Advances to the next tooltip; finishes the tour after the last one.
  void nextStep() {
    final step = state.activeStep;
    if (step == null) {
      return;
    }

    final next = step + 1;
    if (next >= OnboardingTourSteps.count) {
      _finish('completed');
      return;
    }

    AppTelemetry.instance.logEvent('onboarding_tour_step', params: {'step': next});
    emit(OnboardingTourState(completed: false, activeStep: next));
  }

  /// Returns to the previous tooltip. No-op on the first step.
  void previousStep() {
    final step = state.activeStep;
    if (step == null || step == 0) {
      return;
    }

    AppTelemetry.instance.logEvent('onboarding_tour_back', params: {'step': step - 1});
    emit(OnboardingTourState(completed: false, activeStep: step - 1));
  }

  /// Closes the tour early (close button). Still marks it as seen so it
  /// doesn't nag the user on the next visit.
  void dismiss() {
    if (!state.isActive) {
      return;
    }

    _finish('dismissed');
  }

  void _finish(String reason) {
    AppTelemetry.instance.logEvent(
      'onboarding_tour_finished',
      params: {'reason': reason, 'last_step': state.activeStep ?? -1},
    );
    emit(const OnboardingTourState(completed: true));
  }

  @override
  OnboardingTourState fromJson(Map<String, dynamic> json) {
    return OnboardingTourState(completed: json['completed'] == true);
  }

  @override
  Map<String, dynamic> toJson(OnboardingTourState state) => <String, dynamic>{
    'completed': state.completed,
  };
}
