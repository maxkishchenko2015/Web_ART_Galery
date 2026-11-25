import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/gallery_ui.dart';

/// Decade filter chips above the catalog grid ("Все", "60-е" … "90-е").
/// Selecting a chip forwards to [CatalogOfWorksCubit.selectDecade].
class DecadeFilterBar extends StatelessWidget {
  const DecadeFilterBar({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogOfWorksCubit, CatalogOfWorksState>(
      buildWhen: (previous, current) {
        // Only rebuild on selection / availability changes — the chip bar
        // doesn't care about pagination tick or in-flight loads.
        if (previous.runtimeType != current.runtimeType) return true;
        if (previous is CatalogOfWorksLoaded && current is CatalogOfWorksLoaded) {
          return previous.selectedDecade != current.selectedDecade;
        }
        return false;
      },
      builder: (context, state) {
        if (state is! CatalogOfWorksLoaded) return const SizedBox.shrink();
        final selected = state.selectedDecade;
        final labels = context.t.catalog.decade;
        final cubit = context.read<CatalogOfWorksCubit>();

        Widget chip(String label, Decade? decade) => GalleryFilterChip(
          label: label,
          selected: selected == decade,
          compact: compact,
          onTap: () => cubit.selectDecade(decade),
        );

        return Wrap(
          spacing: compact ? KSize.margin2x : KSize.margin3x,
          runSpacing: KSize.margin2x,
          children: [
            chip(labels.all, null),
            chip(labels.sixties, Decade.sixties),
            chip(labels.seventies, Decade.seventies),
            chip(labels.eighties, Decade.eighties),
            chip(labels.nineties, Decade.nineties),
          ],
        );
      },
    );
  }
}
