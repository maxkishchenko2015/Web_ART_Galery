import 'package:flutter/widgets.dart';
import 'package:web_art_galery/src/shared/telemetry/app_telemetry.dart';

/// Wraps a scrollable subtree and emits a `scroll_depth` analytics event each
/// time the user crosses a 25/50/75/100% milestone for the active screen.
///
/// Milestones are reset whenever [screenName] changes, so navigating between
/// pages doesn't suppress events because of a previous screen's progress.
class ScrollDepthTracker extends StatefulWidget {
  const ScrollDepthTracker({super.key, required this.screenName, required this.child});

  final String screenName;
  final Widget child;

  @override
  State<ScrollDepthTracker> createState() => _ScrollDepthTrackerState();
}

class _ScrollDepthTrackerState extends State<ScrollDepthTracker> {
  static const List<int> _milestones = [25, 50, 75, 100];

  final Set<int> _firedMilestones = <int>{};

  @override
  void didUpdateWidget(ScrollDepthTracker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.screenName != widget.screenName) {
      _firedMilestones.clear();
    }
  }

  bool _onScrollUpdate(ScrollUpdateNotification notification) {
    final metrics = notification.metrics;
    final maxExtent = metrics.maxScrollExtent;
    if (maxExtent <= 0) {
      return false;
    }
    final progress = (metrics.pixels / maxExtent).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    for (final milestone in _milestones) {
      if (percent >= milestone && _firedMilestones.add(milestone)) {
        AppTelemetry.instance.logEvent(
          'scroll_depth',
          params: <String, Object?>{
            'screen_name': widget.screenName,
            'depth_pct': milestone,
          },
        );
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _onScrollUpdate,
      child: widget.child,
    );
  }
}
