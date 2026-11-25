import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/nav_destinations.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Terracotta "С чего начать" band: a short welcome plus a cream card with
/// three first-visit routes (biography, signature works, films).
class HomeStartBand extends StatelessWidget {
  const HomeStartBand({super.key, required this.layout, required this.onReadBiography});

  final PageLayout layout;
  final VoidCallback onReadBiography;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final t = context.t.home.start;
    final catalogState = context.watch<CatalogOfWorksCubit>().state;

    final routes = <_StartRoute>[
      _StartRoute(
        title: t.aboutTitle,
        subtitle: t.aboutSubtitle,
        icon: Icons.menu_book_outlined,
        onTap: onReadBiography,
      ),
      if (!NavVisibility.catalogIsSettledEmpty(catalogState))
        _StartRoute(
          title: t.worksTitle,
          subtitle: t.worksSubtitle,
          icon: Icons.filter_frames_outlined,
          onTap: () => context.go(AppRoutes.catalog),
        ),
      _StartRoute(
        title: t.filmsTitle,
        subtitle: t.filmsSubtitle,
        icon: Icons.movie_creation_outlined,
        onTap: () => context.go(AppRoutes.films),
      ),
    ];

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(t.title, style: context.textOnDark.bandTitle(layout.sectionTitleSize)),
        const SizedBox(height: KSize.margin3x),
        Text(t.body, style: context.textOnDark.bandBody),
      ],
    );

    final card = Container(
      decoration: BoxDecoration(
        color: colors.parchmentCard,
        borderRadius: BorderRadius.circular(KSize.homeCardRadius),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadow,
            blurRadius: KSize.margin6x,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: layout.isPhone ? KSize.margin4x : KSize.margin6x,
        vertical: layout.isPhone ? KSize.margin1x : KSize.margin5x,
      ),
      child: layout.isWide
          ? IntrinsicHeight(
              child: Row(
                children: [
                  for (final (i, route) in routes.indexed) ...[
                    if (i > 0)
                      VerticalDivider(
                        width: KSize.margin10x,
                        thickness: KSize.borderWidthVerySmall,
                        color: colors.parchmentLine,
                      ),
                    Expanded(child: _StartRouteTile(route: route)),
                  ],
                ],
              ),
            )
          : Column(
              children: [
                for (final (i, route) in routes.indexed) ...[
                  if (i > 0)
                    Divider(color: colors.parchmentLine, height: KSize.borderWidthVerySmall),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: KSize.margin4x),
                    child: _StartRouteTile(route: route),
                  ),
                ],
              ],
            ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [colors.terracottaDeep, colors.terracotta],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: layout.gutter,
        vertical: layout.isPhone ? KSize.margin8x : KSize.margin10x,
      ),
      child: layout.isWide
          ? Row(
              children: [
                Expanded(flex: 4, child: intro),
                const SizedBox(width: KSize.margin10x),
                Expanded(flex: 11, child: card),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                intro,
                const SizedBox(height: KSize.margin6x),
                card,
              ],
            ),
    );
  }
}

@immutable
class _StartRoute {
  const _StartRoute({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
}

class _StartRouteTile extends StatelessWidget {
  const _StartRouteTile({required this.route});

  final _StartRoute route;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: route.onTap,
        child: Row(
          children: [
            Icon(route.icon, size: KSize.homeStartIcon, color: colors.terracotta),
            const SizedBox(width: KSize.margin4x),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(route.title, style: context.textContent.startRouteTitle),
                  const SizedBox(height: KSize.margin1x),
                  Text(route.subtitle, style: context.textContent.quickLinkSubtitle),
                ],
              ),
            ),
            const SizedBox(width: KSize.margin3x),
            Icon(Icons.arrow_forward_rounded, size: KSize.iconMS, color: colors.terracotta),
          ],
        ),
      ),
    );
  }
}
