# Tooltip Bubble Positioning Pattern

Use a dedicated tooltip widget that receives current step and target rect.

## Inputs

- `step`: current onboarding step.
- `targetRect`: global bounds of highlighted widget.
- `onNext` / `onPrevious` / `onDone` callbacks.

## Positioning Rules

1. Center tooltip around `targetRect.center.dx`.
2. Clamp left position into screen safe margins.
3. Place tooltip below target (`rect.bottom + spacing`) for standard cases.
4. Align arrow to target center but clamp within tooltip border radius bounds.

## Example Calculations

```dart
double tooltipLeft({
  required double screenWidth,
  required double tooltipWidth,
  required Rect targetRect,
  double horizontalPadding = 16,
}) {
  var left = targetRect.center.dx - tooltipWidth / 2;
  if (left < horizontalPadding) left = horizontalPadding;
  final rightLimit = screenWidth - tooltipWidth - horizontalPadding;
  if (left > rightLimit) left = rightLimit;
  return left;
}

double arrowLeft({
  required Rect targetRect,
  required double tooltipGlobalLeft,
  required double tooltipWidth,
  required double arrowWidth,
  required double cornerSafe,
}) {
  final raw = targetRect.center.dx - tooltipGlobalLeft - arrowWidth / 2;
  return raw.clamp(cornerSafe, tooltipWidth - arrowWidth - cornerSafe);
}
```

## UX Notes

- Dismiss on backdrop tap for quick escape.
- Keep transitions smooth with `AnimatedPositioned` + `AnimatedOpacity`.
- Keep one source of truth for step state in Cubit/Bloc.
