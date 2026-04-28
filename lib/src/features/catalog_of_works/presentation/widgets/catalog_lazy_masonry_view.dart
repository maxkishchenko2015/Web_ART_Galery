import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// A lazy-loading masonry grid view.
///
/// Uses [SliverMasonryGrid.count] so cards keep their natural height — each
/// card grows to fit its content (used by the catalog to size each painting
/// to its intrinsic aspect ratio without cropping).
///
/// Manages its own [ScrollController] internally (or accepts an external one
/// via [scrollController]). When the user scrolls within [_loadMoreThreshold]
/// pixels of the bottom, [onLoadMore] is called once per page until
/// [hasReachedMax] is true.
///
/// The loading indicator is rendered as a full-width row **below** the grid
/// (via [SliverToBoxAdapter]) so it never occupies a grid cell.
class CatalogLazyMasonryView extends StatefulWidget {
  const CatalogLazyMasonryView({
    super.key,
    required this.itemCount,
    required this.isLoading,
    required this.hasReachedMax,
    required this.onLoadMore,
    required this.itemBuilder,
    required this.crossAxisCount,
    required this.loadingWidget,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.padding = EdgeInsets.zero,
    this.scrollController,
  });

  final int itemCount;
  final bool isLoading;
  final bool hasReachedMax;
  final VoidCallback onLoadMore;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final Widget loadingWidget;
  final ScrollPhysics physics;
  final EdgeInsets padding;
  final ScrollController? scrollController;

  @override
  State<CatalogLazyMasonryView> createState() => _CatalogLazyMasonryViewState();
}

class _CatalogLazyMasonryViewState extends State<CatalogLazyMasonryView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(CatalogLazyMasonryView oldWidget) {
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
          sliver: SliverMasonryGrid.count(
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: widget.mainAxisSpacing,
            crossAxisSpacing: widget.crossAxisSpacing,
            childCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        if (widget.isLoading && !widget.hasReachedMax && !_shouldHideLoadingWidget)
          SliverToBoxAdapter(child: widget.loadingWidget),
      ],
    );
  }
}
