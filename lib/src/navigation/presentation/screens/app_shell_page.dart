import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/language_switcher.dart';

class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final currentPath = GoRouterState.of(context).uri.path;
    final items = <_NavItem>[
      _NavItem(
        label: context.t.navigation.aboutAuthor,
        location: '/about-author',
        icon: Icons.person_outline,
      ),
      _NavItem(label: context.t.navigation.news, location: '/news', icon: Icons.newspaper_outlined),
      _NavItem(
        label: context.t.navigation.catalogOfWorks,
        location: '/catalog',
        icon: Icons.collections_bookmark_outlined,
      ),
      _NavItem(
        label: context.t.navigation.archive,
        location: '/archive',
        icon: Icons.archive_outlined,
      ),
      _NavItem(
        label: context.t.navigation.contacts,
        location: '/contacts',
        icon: Icons.contacts_outlined,
      ),
    ];
    final selectedIndex = _selectedIndex(items, currentPath);

    if (width < KSize.adaptiveCompactBreakpoint) {
      return Scaffold(
        appBar: _buildAppBar(context),
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          destinations: [
            for (final item in items)
              NavigationDestination(icon: Icon(item.icon), label: item.label),
          ],
          onDestinationSelected: (index) => context.go(items[index].location),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _DesktopTopNavigation(
            items: items,
            selectedIndex: selectedIndex,
            onSelected: (index) => context.go(items[index].location),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1420),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 92,
      title: Padding(
        padding: const EdgeInsets.only(top: KSize.margin2x),
        child: Text(context.t.app.title),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.margin4x),
          child: LanguageSwitcher(),
        ),
      ],
    );
  }

  int _selectedIndex(List<_NavItem> items, String currentPath) {
    final index = items.indexWhere(
      (item) => currentPath == item.location || currentPath.startsWith('${item.location}/'),
    );

    return index >= 0 ? index : 0;
  }
}

class _NavItem {
  const _NavItem({required this.label, required this.location, required this.icon});

  final String label;
  final String location;
  final IconData icon;
}

class _DesktopTopNavigation extends StatelessWidget {
  const _DesktopTopNavigation({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<_NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.colorScheme.outlineVariant),
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin4x),
      child: Row(
        children: [
          for (final entry in items.asMap().entries)
            _DesktopTopNavigationItem(
              label: entry.value.label,
              selected: entry.key == selectedIndex,
              onTap: () => onSelected(entry.key),
            ),
        ],
      ),
    );
  }
}

class _DesktopTopNavigationItem extends StatelessWidget {
  const _DesktopTopNavigationItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: selected
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: KSize.margin7x),
        padding: const EdgeInsets.symmetric(vertical: KSize.margin3x),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Theme.of(context).colorScheme.onSurface : Colors.transparent,
              width: KSize.borderWidthSmall,
            ),
          ),
        ),
        child: Text(label, style: textStyle),
      ),
    );
  }
}
