import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_art_galery/src/shared/config/app_palette.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

@immutable
class AppPaletteState {
  const AppPaletteState({required this.palette, required this.userSelected});

  final AppPalette palette;

  /// The visitor picked [palette] in the switcher — it then wins over the
  /// Remote Config default theme.
  final bool userSelected;

  @override
  bool operator ==(Object other) =>
      other is AppPaletteState && other.palette == palette && other.userSelected == userSelected;

  @override
  int get hashCode => Object.hash(palette, userSelected);
}

/// The site palette on screen. Defaults to the Remote Config theme
/// (`APP_THEME`, or the bundled fallback) until the visitor picks one in the
/// switcher; that choice is persisted across visits.
class AppPaletteCubit extends HydratedCubit<AppPaletteState> {
  AppPaletteCubit({required AppPalette defaultPalette})
    : super(AppPaletteState(palette: defaultPalette, userSelected: false)) {
    // A stored non-user palette is just a stale default — use today's.
    if (!state.userSelected && state.palette != defaultPalette) {
      emit(AppPaletteState(palette: defaultPalette, userSelected: false));
    }
  }

  /// Theme from config ([source] = `remote` / `fallback`); ignored once the
  /// visitor has chosen a palette themselves.
  void applyConfigDefault(AppPalette palette, {required String source}) {
    if (state.userSelected) {
      _reportShown(source: 'user');
      return;
    }
    if (palette != state.palette) {
      emit(AppPaletteState(palette: palette, userSelected: false));
    }
    _reportShown(source: source);
  }

  /// Visitor's pick in the palette switcher.
  void select(AppPalette palette) {
    if (palette == state.palette && state.userSelected) return;
    AppTelemetry.instance.logEvent(
      'palette_changed',
      params: {'from': state.palette.name, 'to': palette.name},
    );
    emit(AppPaletteState(palette: palette, userSelected: true));
    _reportShown(source: 'user');
  }

  /// Which theme the visitor actually sees, and why.
  void _reportShown({required String source}) {
    AppTelemetry.instance.logEvent(
      'theme_shown',
      params: {'palette': state.palette.name, 'source': source},
    );
    AppTelemetry.instance.setUserProperty('app_theme', state.palette.name);
  }

  @override
  AppPaletteState fromJson(Map<String, dynamic> json) {
    final name = json['palette'] as String?;
    final palette = AppPalette.values.firstWhere(
      (p) => p.name == name,
      orElse: () => state.palette,
    );
    return AppPaletteState(palette: palette, userSelected: json['userSelected'] == true);
  }

  @override
  Map<String, dynamic> toJson(AppPaletteState state) => <String, dynamic>{
    'palette': state.palette.name,
    'userSelected': state.userSelected,
  };
}
