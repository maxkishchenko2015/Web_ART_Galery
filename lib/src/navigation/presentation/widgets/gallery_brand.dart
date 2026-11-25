import 'package:material_ui/material_ui.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Circular "КА" monogram used across the dark shell surfaces.
class GalleryLogo extends StatelessWidget {
  const GalleryLogo({super.key, this.size = KSize.logoSizeLarge});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.onDarkSubtle, width: KSize.borderWidthVerySmall),
      ),
      alignment: Alignment.center,
      child: Text(context.t.app.logoMark, style: context.textOnDark.logoMark(size)),
    );
  }
}

/// Logo + "КИЩЕНКО-АРТ" title, optionally with the collection tagline below.
class GalleryBrand extends StatelessWidget {
  const GalleryBrand({
    super.key,
    this.logoSize = KSize.logoSizeLarge,
    this.showTagline = true,
    this.gap = KSize.margin4x,
  });

  final double logoSize;
  final bool showTagline;
  final double gap;

  @override
  Widget build(BuildContext context) {
    // Bounded on its own: the brand often sits directly in a Row (header,
    // footer bar), where the Flexible title below would otherwise get an
    // unbounded width.
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: KSize.homeBrandMaxWidth),
      child: _buildRow(context),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GalleryLogo(size: logoSize),
        SizedBox(width: gap),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.app.title.toUpperCase(),
                style: context.textOnDark.brandTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showTagline) ...[
                const SizedBox(height: KSize.marginHalf),
                Text(
                  context.t.app.brandTagline,
                  style: context.textOnDark.brandSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
