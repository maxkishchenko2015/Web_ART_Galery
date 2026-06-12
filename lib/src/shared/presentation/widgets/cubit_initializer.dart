import 'package:flutter/widgets.dart';

/// Runs [onInit] exactly once, when this widget is first inserted into the
/// tree, then renders [child] unchanged.
///
/// Used to move a page's data-loading trigger (e.g.
/// `context.read<XCubit>().load()`) out of the root provider's `create:`
/// callback and into the page that actually needs the data. Combined with the
/// cubits' own "already loaded" guards, this means a feature never fetches
/// over the network until its route is visited — and revisiting the route
/// re-runs [onInit] but the guard makes the redundant load a no-op.
class CubitInitializer extends StatefulWidget {
  const CubitInitializer({super.key, required this.onInit, required this.child});

  /// Invoked once from [State.initState]. Receives the [BuildContext] so the
  /// callback can `context.read<T>()` the cubit it needs to kick off.
  final void Function(BuildContext context) onInit;

  final Widget child;

  @override
  State<CubitInitializer> createState() => _CubitInitializerState();
}

class _CubitInitializerState extends State<CubitInitializer> {
  @override
  void initState() {
    super.initState();
    widget.onInit(context);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
