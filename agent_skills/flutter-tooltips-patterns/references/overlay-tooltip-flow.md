# Overlay Tooltip Flow

Use this pattern for feature tours that must survive async timing, route changes, and widget visibility changes.

## Flow

1. Listen for feature/widget visibility event.
2. Check eligibility (feature flag, first-time guard, route current).
3. Schedule delayed display (`Timer`) to avoid early layout races.
4. Build and insert `OverlayEntry`.
5. Capture target snapshots before showing first step.
6. Render backdrop + highlighted target + tooltip bubble.
7. Advance steps via Cubit/Bloc.
8. On finish or hidden state: remove overlay, clear snapshot data.

## Mixin Template

```dart
mixin FeatureTooltipMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;
  StreamSubscription<dynamic>? _visibilitySub;
  Timer? _showTimer;

  Future<void> initFeatureTooltips() async {
    final alreadyShown = await _readAlreadyShown();
    if (alreadyShown == true) return;

    _visibilitySub = eventBus.listen<FeatureVisibilityEvent>(_onVisibility);
  }

  void _onVisibility(FeatureVisibilityEvent event) {
    _cancelSchedule();
    if (!event.isVisible || !_isFeatureAvailable || !_isCurrentRoute()) return;

    _showTimer = Timer(const Duration(milliseconds: 300), () async {
      if (!mounted || _overlayEntry != null || !_isCurrentRoute()) return;
      _showOverlay();
    });
  }

  bool _isCurrentRoute() {
    final route = ModalRoute.of(context);
    return mounted && route != null && route.isCurrent;
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) => const SizedBox());
    overlay.insert(_overlayEntry!);
  }

  void finishTooltips() {
    _cancelSchedule();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _cancelSchedule() {
    _showTimer?.cancel();
    _showTimer = null;
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    _visibilitySub?.cancel();
    _showTimer?.cancel();
    super.dispose();
  }
}
```

## Reliability Checklist

- Guard against duplicate overlay creation.
- Re-check route currentness right before insert.
- Dismiss on background tap.
- Protect against stale async callbacks with `mounted` checks.
