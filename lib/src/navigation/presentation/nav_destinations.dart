import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/router/app_routes.dart';

/// One top-level section of the site (header link, drawer row, footer link).
@immutable
class NavDestination {
  const NavDestination({required this.label, required this.location, required this.icon});

  final String label;
  final String location;
  final IconData icon;
}

/// Shared rules for hiding Firebase-backed sections that have nothing to show.
///
/// A section counts as "having content" only once its cubit has settled into a
/// Loaded state with a non-empty list. Initial/Loading keep the section
/// visible so cold-start ticks don't flicker the menu, and Error/empty-Loaded
/// both hide it so users can't land on a blank page.
abstract final class NavVisibility {
  const NavVisibility._();

  static bool newsHasContent(NewsListState s) => s is NewsListLoaded && s.articles.isNotEmpty;

  static bool catalogHasContent(CatalogOfWorksState s) =>
      s is CatalogOfWorksLoaded && s.paintings.isNotEmpty;

  static bool newsIsSettledEmpty(NewsListState s) =>
      s is NewsListError || (s is NewsListLoaded && s.articles.isEmpty);

  static bool catalogIsSettledEmpty(CatalogOfWorksState s) =>
      s is CatalogOfWorksError || (s is CatalogOfWorksLoaded && s.paintings.isEmpty);
}

/// Site sections in menu order. News / catalog are left out when their
/// Firestore content settled empty (see [NavVisibility]).
List<NavDestination> buildNavDestinations(
  BuildContext context, {
  required bool hideNews,
  required bool hideCatalog,
}) => [
  NavDestination(
    label: context.t.navigation.aboutAuthor,
    location: AppRoutes.aboutAuthor,
    icon: Icons.person_outline,
  ),
  if (!hideNews)
    NavDestination(
      label: context.t.navigation.news,
      location: AppRoutes.news,
      icon: Icons.newspaper_outlined,
    ),
  if (!hideCatalog)
    NavDestination(
      label: context.t.navigation.catalogOfWorks,
      location: AppRoutes.catalog,
      icon: Icons.collections_bookmark_outlined,
    ),
  NavDestination(
    label: context.t.navigation.films,
    location: AppRoutes.films,
    icon: Icons.movie_outlined,
  ),
  NavDestination(
    label: context.t.navigation.archive,
    location: AppRoutes.archive,
    icon: Icons.archive_outlined,
  ),
  NavDestination(
    label: context.t.navigation.contacts,
    location: AppRoutes.contacts,
    icon: Icons.contacts_outlined,
  ),
];
