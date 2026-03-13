# Snapshot Overlay Pattern

This pattern highlights real UI targets by rendering captured snapshots over a blurred backdrop.

## Core Structure

- `SnapshotDataController<T>` stores captured snapshots by step.
- `SnapshotsHelper` captures targets from `GlobalKey` + `RenderRepaintBoundary`.
- `SnapshotOverlayStack<T>` shows only the current step snapshot with animation.

## Capture Strategy

1. Define enum steps for tooltip flow.
2. Map each step to a target `GlobalKey`.
3. Capture snapshots once before first visible tooltip step.
4. Reuse stored snapshots while stepping through tour.
5. On finish, dispose images and clear maps safely.

## Generic Capture Example

```dart
enum FeatureStep { overview, actionA, actionB }

final controller = SnapshotDataController<FeatureStep>();

Future<void> captureTargets({required double pixelRatio}) async {
  await controller.capture(
    targets: {
      FeatureStep.overview: overviewKey,
      FeatureStep.actionA: actionAKey,
      FeatureStep.actionB: actionBKey,
    },
    pixelRatio: pixelRatio,
  );
}
```

## Safety Rules

- Wrap capture in `try/catch`; UI may be gone before capture runs.
- Use `clearSafe()` when snapshot entries can share image instances.
- Use immutable views for consumer widgets (`Map.unmodifiable`).
- Never keep stale `GlobalKey` references across screen rebuild boundaries.
