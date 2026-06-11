import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/src/features/about_author/presentation/cubits/onboarding_tour_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

/// Copy rendered inside a single onboarding tooltip step.
class OnboardingTourTooltipData {
  const OnboardingTourTooltipData({
    required this.stepLabel,
    required this.title,
    required this.body,
    required this.buttonLabel,
    this.backLabel,
    this.linkLabel,
    this.linkUrl,
  });

  final String stepLabel;
  final String title;
  final String body;
  final String buttonLabel;

  /// Secondary "back" action label; the button is hidden when null.
  final String? backLabel;

  /// Optional external link (e.g. the tapestry article); rendered as a
  /// tappable row above the buttons when both [linkLabel] and [linkUrl] are set.
  final String? linkLabel;
  final String? linkUrl;
}

/// Orchestrates the onboarding tour from a host screen state.
///
/// Listens to [OnboardingTourCubit]; on each step it scrolls the step's
/// target into view, then presents [OnboardingTourLayer] in the root
/// [Overlay] with the target highlighted through a scrim cutout.
///
/// Host contract:
/// - call [attachOnboardingTour] in `initState` and [detachOnboardingTour]
///   in `dispose`;
/// - kick off the first-visit flow with [scheduleOnboardingTourStart];
/// - implement [onboardingTourTargetKey] / [onboardingTourTooltipData].
mixin OnboardingTourHostMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _tourEntry;
  StreamSubscription<OnboardingTourState>? _tourSubscription;
  Timer? _tourStartTimer;
  int? _visibleStep;

  /// Set when the final step's primary button is tapped, so the end-of-tour
  /// teardown can tell "finished" (→ scroll back to top) apart from an early
  /// dismiss via the close button (→ stay put).
  bool _completedFully = false;

  /// Widget the scrim cutout and tooltip should point at for [step].
  GlobalKey onboardingTourTargetKey(int step);

  /// Localized copy for the tooltip shown at [step].
  OnboardingTourTooltipData onboardingTourTooltipData(BuildContext context, int step);

  /// Corner radius of the scrim cutout for [step]; override per target shape.
  double onboardingTourHoleRadius(int step) => KSize.radiusLargeExtra;

  /// Awaited before the tour starts — override to defer the first autoscroll
  /// until the highlighted content (e.g. photos) is actually on screen.
  Future<void> prepareOnboardingTour() async {}

  /// Called once the visitor finishes the final step via its primary button
  /// (not on an early close). Override to navigate away, etc. The default
  /// keeps the page where it is.
  void onOnboardingTourCompleted() {}

  void attachOnboardingTour() {
    _tourSubscription = context.read<OnboardingTourCubit>().stream.listen(_handleTourState);
  }

  void detachOnboardingTour() {
    _tourStartTimer?.cancel();
    _tourStartTimer = null;
    _tourSubscription?.cancel();
    _tourSubscription = null;
    _removeTourOverlay();
  }

  /// Starts the tour for first-time visitors once the page has settled on
  /// screen. The cubit ignores the call when the tour was already seen.
  void scheduleOnboardingTourStart() {
    _tourStartTimer?.cancel();
    _tourStartTimer = Timer(KSize.durationTourStartDelay, () async {
      if (!_isTourRouteCurrent) {
        return;
      }
      final cubit = context.read<OnboardingTourCubit>();
      // Skip the (potentially slow) preparation entirely for returning
      // visitors — the cubit would ignore start() anyway.
      if (cubit.state.completed) {
        return;
      }
      await prepareOnboardingTour();
      if (!_isTourRouteCurrent) {
        return;
      }
      cubit.start();
    });
  }

  bool get _isTourRouteCurrent {
    if (!mounted) {
      return false;
    }
    final route = ModalRoute.of(context);
    return route == null || route.isCurrent;
  }

  Future<void> _handleTourState(OnboardingTourState state) async {
    if (!mounted) {
      _removeTourOverlay();
      return;
    }

    final step = state.activeStep;
    if (step == null) {
      _finishTourOverlay();
      return;
    }
    if (step == _visibleStep) {
      return;
    }
    _visibleStep = step;

    // Bring the step's target into view before presenting the tooltip; the
    // previous tooltip is removed first so it never points at a stale rect.
    _removeTourOverlay();
    final targetContext = onboardingTourTargetKey(step).currentContext;
    if (targetContext != null) {
      await Scrollable.ensureVisible(
        targetContext,
        alignment: 0.5,
        duration: KSize.durationScroll,
        curve: Curves.easeInOut,
      );
    }
    // The state may have advanced (or the page closed) while scrolling.
    if (!mounted || _visibleStep != step) {
      return;
    }
    _showTourOverlay(step);
  }

  void _showTourOverlay(int step) {
    final cubit = context.read<OnboardingTourCubit>();
    final isLastStep = step >= OnboardingTourSteps.count - 1;
    final entry = OverlayEntry(
      builder: (overlayContext) => OnboardingTourLayer(
        key: ValueKey<int>(step),
        targetKey: onboardingTourTargetKey(step),
        data: onboardingTourTooltipData(overlayContext, step),
        holeRadius: onboardingTourHoleRadius(step),
        onNext: () {
          if (isLastStep) {
            _completedFully = true;
          }
          cubit.nextStep();
        },
        onBack: step > 0 ? cubit.previousStep : null,
        onClose: cubit.dismiss,
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(entry);
    _tourEntry = entry;
  }

  /// Tears down the overlay when the tour ends.
  ///
  /// Finishing the last step (primary button) hands off to
  /// [onOnboardingTourCompleted] (e.g. navigate elsewhere). An early dismiss
  /// (close button) instead pins the current scroll offset, restoring it next
  /// frame if anything kicks it back (observed on web, where closing the
  /// overlay could otherwise jump the page to the top).
  void _finishTourOverlay() {
    final completedFully = _completedFully;
    _completedFully = false;
    final lastStep = _visibleStep;
    _visibleStep = null;

    _removeTourOverlay();

    if (completedFully) {
      onOnboardingTourCompleted();
      return;
    }

    final targetContext = lastStep == null
        ? null
        : onboardingTourTargetKey(lastStep).currentContext;
    final position = targetContext == null
        ? null
        : Scrollable.maybeOf(targetContext)?.position;
    if (position == null || !position.hasPixels) {
      return;
    }
    final offset = position.pixels;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !position.hasPixels) {
        return;
      }
      if (position.pixels != offset) {
        position.jumpTo(
          offset.clamp(position.minScrollExtent, position.maxScrollExtent),
        );
      }
    });
  }

  void _removeTourOverlay() {
    _tourEntry?.remove();
    _tourEntry = null;
  }
}

/// Full-screen tour layer: input-blocking scrim with a rounded cutout over
/// the target widget, plus a tooltip bubble with an arrow pointing at it.
///
/// The bubble is measured off-screen on the first frame, then positioned on
/// whichever side of the target has room (below → above → beside → pinned to
/// the bottom edge as a last resort).
class OnboardingTourLayer extends StatefulWidget {
  const OnboardingTourLayer({
    super.key,
    required this.targetKey,
    required this.data,
    required this.holeRadius,
    required this.onNext,
    required this.onClose,
    this.onBack,
  });

  final GlobalKey targetKey;
  final OnboardingTourTooltipData data;

  /// Corner radius of the scrim cutout (matches the highlighted widget).
  final double holeRadius;

  final VoidCallback onNext;
  final VoidCallback onClose;

  /// Returns to the previous step; the back button is hidden when null.
  final VoidCallback? onBack;

  @override
  State<OnboardingTourLayer> createState() => _OnboardingTourLayerState();
}

class _OnboardingTourLayerState extends State<OnboardingTourLayer>
    with WidgetsBindingObserver {
  final _bubbleKey = GlobalKey();
  Size? _bubbleSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (!mounted) {
      return;
    }
    // Window resize moves the target and changes the width budget for the
    // bubble — drop the cached size and run the measure pass again.
    setState(() => _bubbleSize = null);
  }

  Rect? _measureTargetRect() {
    final box = widget.targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.attached || !box.hasSize) {
      return null;
    }
    return box.localToGlobal(Offset.zero) & box.size;
  }

  void _scheduleBubbleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _bubbleSize != null) {
        return;
      }
      final box = _bubbleKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) {
        return;
      }
      setState(() => _bubbleSize = box.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final targetRect = _measureTargetRect();
    if (targetRect == null) {
      return const SizedBox.shrink();
    }

    final hole = targetRect.inflate(KSize.margin2x);
    final bubble = _TourBubble(
      key: _bubbleKey,
      data: widget.data,
      maxWidth: math.min(KSize.tourTooltipMaxWidth, screen.width - KSize.margin4x * 2),
      maxHeight: screen.height * KSize.tourTooltipMaxHeightFactor,
      onNext: widget.onNext,
      onBack: widget.onBack,
      onClose: widget.onClose,
    );

    final bubbleSize = _bubbleSize;
    if (bubbleSize == null) {
      _scheduleBubbleMeasure();
    }
    final placement = bubbleSize == null ? null : _resolvePlacement(screen, hole, bubbleSize);

    // Opaque listener: absorbs taps and mouse-wheel scrolling everywhere
    // (including the cutout) so the page underneath stays frozen mid-tour.
    return Listener(
      behavior: HitTestBehavior.opaque,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Material(
          type: MaterialType.transparency,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: KSize.durationMedium,
            builder: (context, opacity, child) => Opacity(opacity: opacity, child: child),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: _TourScrimPainter(
                    hole: hole,
                    holeRadius: widget.holeRadius + KSize.margin2x,
                    scrimColor: Colors.black.withValues(alpha: 0.6),
                    borderColor: context.colors.onDark,
                  ),
                ),
                if (placement == null)
                  // Measure pass: lay the bubble out without painting it.
                  Offstage(child: Align(alignment: Alignment.topLeft, child: bubble))
                else ...[
                  if (placement.arrowRect != null)
                    Positioned.fromRect(
                      rect: placement.arrowRect!,
                      child: CustomPaint(
                        painter: _TourArrowPainter(
                          color: context.colors.white,
                          direction: placement.arrowDirection!,
                        ),
                      ),
                    ),
                  Positioned(
                    left: placement.bubbleTopLeft.dx,
                    top: placement.bubbleTopLeft.dy,
                    child: bubble,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TourPlacement {
  const _TourPlacement({required this.bubbleTopLeft, this.arrowRect, this.arrowDirection});

  final Offset bubbleTopLeft;
  final Rect? arrowRect;

  /// Direction the arrow tip points, i.e. towards the highlighted target.
  final AxisDirection? arrowDirection;
}

_TourPlacement _resolvePlacement(Size screen, Rect hole, Size bubble) {
  const edge = KSize.margin4x;
  const gap = KSize.tourArrowLength + KSize.margin1x;
  // Keep the arrow clear of the bubble's rounded corners.
  const arrowInset = KSize.radiusMedium + KSize.tourArrowWidth / 2;

  double clampX(double x) => x.clamp(edge, math.max(edge, screen.width - bubble.width - edge)).toDouble();
  double clampY(double y) => y.clamp(edge, math.max(edge, screen.height - bubble.height - edge)).toDouble();

  final fitsBelow = hole.bottom + gap + bubble.height + edge <= screen.height;
  final fitsAbove = hole.top - gap - bubble.height - edge >= 0;
  final fitsRight = hole.right + gap + bubble.width + edge <= screen.width;
  final fitsLeft = hole.left - gap - bubble.width - edge >= 0;

  if (fitsBelow || fitsAbove) {
    final top = fitsBelow ? hole.bottom + gap : hole.top - gap - bubble.height;
    final left = clampX(hole.center.dx - bubble.width / 2);
    final arrowCenterX = hole.center.dx
        .clamp(left + arrowInset, left + bubble.width - arrowInset)
        .toDouble();
    return _TourPlacement(
      bubbleTopLeft: Offset(left, top),
      arrowRect: Rect.fromLTWH(
        arrowCenterX - KSize.tourArrowWidth / 2,
        fitsBelow ? top - KSize.tourArrowLength : top + bubble.height,
        KSize.tourArrowWidth,
        KSize.tourArrowLength,
      ),
      arrowDirection: fitsBelow ? AxisDirection.up : AxisDirection.down,
    );
  }

  if (fitsRight || fitsLeft) {
    final left = fitsRight ? hole.right + gap : hole.left - gap - bubble.width;
    final top = clampY(hole.center.dy - bubble.height / 2);
    final arrowCenterY = hole.center.dy
        .clamp(top + arrowInset, top + bubble.height - arrowInset)
        .toDouble();
    return _TourPlacement(
      bubbleTopLeft: Offset(left, top),
      arrowRect: Rect.fromLTWH(
        fitsRight ? left - KSize.tourArrowLength : left + bubble.width,
        arrowCenterY - KSize.tourArrowWidth / 2,
        KSize.tourArrowLength,
        KSize.tourArrowWidth,
      ),
      arrowDirection: fitsRight ? AxisDirection.left : AxisDirection.right,
    );
  }

  // No side has room (target nearly fills the viewport) — overlap the
  // bottom edge, centred on the target, without an arrow.
  return _TourPlacement(
    bubbleTopLeft: Offset(
      clampX(hole.center.dx - bubble.width / 2),
      math.max(edge, screen.height - bubble.height - edge),
    ),
  );
}

class _TourBubble extends StatelessWidget {
  const _TourBubble({
    super.key,
    required this.data,
    required this.maxWidth,
    required this.maxHeight,
    required this.onNext,
    required this.onClose,
    this.onBack,
  });

  final OnboardingTourTooltipData data;
  final double maxWidth;
  final double maxHeight;
  final VoidCallback onNext;
  final VoidCallback onClose;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.textContent;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          KSize.margin5x,
          KSize.margin4x,
          KSize.margin5x,
          KSize.margin5x,
        ),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(KSize.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: colors.overlayShadow,
              blurRadius: KSize.margin5x,
              offset: const Offset(0, KSize.margin1Halfx),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(data.stepLabel, style: text.tourStepLabel)),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onClose,
                    child: Icon(Icons.close, size: KSize.iconMS, color: colors.contentMuted),
                  ),
                ),
              ],
            ),
            const SizedBox(height: KSize.margin1Halfx),
            Text(data.title, style: text.tourTitle),
            const SizedBox(height: KSize.margin3x),
            // Long step copy (e.g. the Chernobyl story) scrolls inside the
            // bubble instead of growing past the viewport.
            Flexible(
              child: SingleChildScrollView(
                child: Text(data.body, style: text.tourBody),
              ),
            ),
            if (data.linkLabel != null && data.linkUrl != null) ...[
              const SizedBox(height: KSize.margin3x),
              _TourLink(label: data.linkLabel!, url: data.linkUrl!),
            ],
            const SizedBox(height: KSize.margin4x),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onBack != null && data.backLabel != null) ...[
                  _TourPillButton(
                    label: data.backLabel!,
                    filled: false,
                    onTap: onBack!,
                  ),
                  const SizedBox(width: KSize.margin2x),
                ],
                _TourPillButton(label: data.buttonLabel, filled: true, onTap: onNext),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Tappable external-reference link inside the tour bubble. Mirrors the bio
/// "open article" link: uppercase forest-green label + outward arrow.
class _TourLink extends StatelessWidget {
  const _TourLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: url),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: context.textContent.archiveLink),
            const SizedBox(width: KSize.margin1Halfx),
            Icon(
              Icons.arrow_outward_rounded,
              size: KSize.iconSPlus,
              color: context.colors.forestGreen,
            ),
          ],
        ),
      ),
    );
  }
}

/// Pill action button inside the tour bubble: filled (primary / next) or
/// outlined (secondary / back), mirroring the hero-section button pair.
class _TourPillButton extends StatelessWidget {
  const _TourPillButton({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.textContent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KSize.margin5x,
            vertical: KSize.margin2x,
          ),
          decoration: BoxDecoration(
            color: filled ? colors.forestGreen : Colors.transparent,
            border: Border.all(color: colors.forestGreen),
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
          ),
          child: Text(
            label.toUpperCase(),
            style: filled ? text.tourButtonLabel : text.tourBackButtonLabel,
          ),
        ),
      ),
    );
  }
}

/// Paints the dimming scrim with a rounded-rect cutout over the target and a
/// thin highlight border around the cutout.
class _TourScrimPainter extends CustomPainter {
  const _TourScrimPainter({
    required this.hole,
    required this.holeRadius,
    required this.scrimColor,
    required this.borderColor,
  });

  final Rect hole;
  final double holeRadius;
  final Color scrimColor;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final holeRRect = RRect.fromRectAndRadius(hole, Radius.circular(holeRadius));
    final scrim = Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(holeRRect),
    );
    canvas.drawPath(scrim, Paint()..color = scrimColor);
    canvas.drawRRect(
      holeRRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = KSize.borderWidthSmall
        ..color = borderColor,
    );
  }

  @override
  bool shouldRepaint(_TourScrimPainter oldDelegate) =>
      hole != oldDelegate.hole ||
      holeRadius != oldDelegate.holeRadius ||
      scrimColor != oldDelegate.scrimColor ||
      borderColor != oldDelegate.borderColor;
}

/// Solid triangle pointer attached to the tooltip bubble; [direction] is
/// where the tip points (towards the highlighted target).
class _TourArrowPainter extends CustomPainter {
  const _TourArrowPainter({required this.color, required this.direction});

  final Color color;
  final AxisDirection direction;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    switch (direction) {
      case AxisDirection.up:
        path
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height);
      case AxisDirection.down:
        path
          ..moveTo(0, 0)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(size.width, 0);
      case AxisDirection.left:
        path
          ..moveTo(size.width, 0)
          ..lineTo(0, size.height / 2)
          ..lineTo(size.width, size.height);
      case AxisDirection.right:
        path
          ..moveTo(0, 0)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(0, size.height);
    }
    canvas.drawPath(path..close(), Paint()..color = color);
  }

  @override
  bool shouldRepaint(_TourArrowPainter oldDelegate) =>
      color != oldDelegate.color || direction != oldDelegate.direction;
}
