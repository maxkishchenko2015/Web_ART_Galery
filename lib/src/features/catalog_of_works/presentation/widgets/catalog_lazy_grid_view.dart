import 'package:flutter/material.dart';

/// A lazy-loading grid view modelled after IDTLazyListView.
///
/// Manages its own [ScrollController] internally (or accepts an external one
/// via [scrollController]). When the user scrolls within [_loadMoreThreshold]
/// pixels of the bottom, [onLoadMore] is called once per page until
/// [hasReachedMax] is true.
///
/// The loading indicator is rendered as a full-width row **below** the grid
/// (via [SliverToBoxAdapter]) so it never occupies a grid cell.
class CatalogLazyGridView extends StatefulWidget {
  const CatalogLazyGridView({
    super.key,
    required this.itemCount,
    required this.isLoading,
    required this.hasReachedMax,
    required this.onLoadMore,
    required this.itemBuilder,
    required this.gridDelegate,
    required this.loadingWidget,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.padding = EdgeInsets.zero,
    this.scrollController,
  });

  final int itemCount;
  final bool isLoading;
  final bool hasReachedMax;
  final VoidCallback onLoadMore;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final SliverGridDelegate gridDelegate;
  final Widget loadingWidget;
  final ScrollPhysics physics;
  final EdgeInsets padding;
  final ScrollController? scrollController;

  @override
  State<CatalogLazyGridView> createState() => _CatalogLazyGridViewState();
}

class _CatalogLazyGridViewState extends State<CatalogLazyGridView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(CatalogLazyGridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      _scrollController.removeListener(_onScroll);
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_shouldLoadMore) widget.onLoadMore();
  }

  double get _loadMoreThreshold => 200.0;

  double get _maxScroll =>
      _scrollController.hasClients ? _scrollController.position.maxScrollExtent : 0.0;

  bool get _contentFitsOnScreen => _maxScroll == 0.0;

  /// Prevents the loading widget from showing when the full list is already
  /// visible and AlwaysScrollableScrollPhysics would allow over-scroll.
  bool get _shouldHideLoadingWidget =>
      widget.physics is AlwaysScrollableScrollPhysics && _contentFitsOnScreen;

  bool get _shouldLoadMore {
    if (!mounted || !_scrollController.hasClients || widget.isLoading) return false;
    if (_contentFitsOnScreen) return false;
    return _scrollController.position.pixels >= (_maxScroll - _loadMoreThreshold);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: widget.physics,
      slivers: [
        SliverPadding(
          padding: widget.padding,
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(widget.itemBuilder, childCount: widget.itemCount),
            gridDelegate: widget.gridDelegate,
          ),
        ),
        if (widget.isLoading && !widget.hasReachedMax && !_shouldHideLoadingWidget)
          SliverToBoxAdapter(child: widget.loadingWidget),
      ],
    );
  }
}
