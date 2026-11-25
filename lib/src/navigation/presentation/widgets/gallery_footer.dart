import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/features/contacts/presentation/screens/contacts_page_constants.dart';
import 'package:web_art_galery/src/features/news/presentation/cubits/news_list_cubit.dart';
import 'package:web_art_galery/src/navigation/presentation/nav_destinations.dart';
import 'package:web_art_galery/src/navigation/presentation/widgets/gallery_brand.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/utils/url_launcher_utils.dart';

/// Full site footer placed at the end of the home page: brand, section
/// links, social links and the copyright line.
class GalleryFooter extends StatelessWidget {
  const GalleryFooter({super.key, required this.gutter, required this.isPhone});

  final double gutter;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final t = context.t;
    final items = buildNavDestinations(
      context,
      hideNews: NavVisibility.newsIsSettledEmpty(context.watch<NewsListCubit>().state),
      hideCatalog: NavVisibility.catalogIsSettledEmpty(context.watch<CatalogOfWorksCubit>().state),
    );

    final brand = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const GalleryBrand(logoSize: KSize.avatarDefault),
        const SizedBox(height: KSize.margin4x),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: KSize.floatingMenuMaxWidth + KSize.margin10x),
          child: Text(t.bio.tagline, style: context.textOnDark.footerLink),
        ),
      ],
    );

    final sections = _FooterColumn(
      title: t.home.footer.sections,
      child: Wrap(
        direction: isPhone ? Axis.horizontal : Axis.vertical,
        spacing: isPhone ? KSize.margin5x : KSize.margin2x,
        runSpacing: KSize.margin2x,
        children: [
          for (final item in items)
            _FooterLink(label: item.label, onTap: () => context.go(item.location)),
        ],
      ),
    );

    final social = _FooterColumn(
      title: t.home.footer.social,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SocialButton(
            asset: ContactsPageConstants.instagramSvgAsset,
            label: t.contacts.instagramSectionLabel,
            url: ContactsPageConstants.instagramUrl,
          ),
          const SizedBox(width: KSize.margin3x),
          _SocialButton(
            asset: ContactsPageConstants.vkSvgAsset,
            label: t.contacts.vkSectionLabel,
            url: ContactsPageConstants.vkUrl,
          ),
        ],
      ),
    );

    return Container(
      color: colors.shell,
      padding: EdgeInsets.fromLTRB(gutter, KSize.margin10x, gutter, KSize.margin6x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isPhone)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                brand,
                const SizedBox(height: KSize.margin8x),
                sections,
                const SizedBox(height: KSize.margin8x),
                social,
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: brand),
                const SizedBox(width: KSize.homeFooterColumnGap),
                Expanded(flex: 2, child: sections),
                const SizedBox(width: KSize.homeFooterColumnGap),
                Expanded(flex: 2, child: social),
              ],
            ),
          const SizedBox(height: KSize.margin8x),
          Divider(color: colors.onDarkDivider, height: KSize.borderWidthVerySmall),
          const SizedBox(height: KSize.margin5x),
          Text(
            '© ${DateTime.now().year} ${t.app.title}. ${t.home.footer.rights}',
            style: context.textOnDark.footerCopyright,
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: context.textOnDark.footerHeading),
        const SizedBox(height: KSize.margin4x),
        child,
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(label, style: context.textOnDark.footerLink),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.asset, required this.label, required this.url});

  final String asset;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      link: true,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => UrlLauncherUtils.launchUrlIfPossible(url: url),
          child: Container(
            width: KSize.avatarDefault,
            height: KSize.avatarDefault,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors.onDarkDivider),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              asset,
              width: KSize.iconMS,
              height: KSize.iconMS,
              colorFilter: ColorFilter.mode(colors.onDark, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
