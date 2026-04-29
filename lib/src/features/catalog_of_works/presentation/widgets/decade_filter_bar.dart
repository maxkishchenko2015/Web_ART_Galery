import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/catalog_of_works/presentation/cubits/catalog_of_works_cubit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// Horizontal chip bar above the catalog grid. Renders one chip per
/// supported decade plus an "All" reset chip; selection is single-select.
///
/// Reads the active filter from [CatalogOfWorksCubit] and writes back via
/// [CatalogOfWorksCubit.selectDecade]. Stays inert (returns
/// [SizedBox.shrink]) while the cubit is still in its loading or error
/// state so the chips never appear before there's data to filter.
class DecadeFilterBar extends StatelessWidget {
  const DecadeFilterBar({super.key});

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
        return _DecadeFilterBarView(selected: state.selectedDecade);
      },
    );
  }
}

class _DecadeFilterBarView extends StatelessWidget {
  const _DecadeFilterBarView({required this.selected});

  final Decade? selected;

  @override
  Widget build(BuildContext context) {
    final labels = context.t.catalog.decade;
    final cubit = context.read<CatalogOfWorksCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        KSize.margin4x,
        KSize.margin5x,
        KSize.margin4x,
        0,
      ),
      child: Wrap(
        spacing: KSize.margin2x,
        runSpacing: KSize.margin2x,
        children: [
          _DecadeChip(
            label: labels.all,
            isSelected: selected == null,
            onTap: () => cubit.selectDecade(null),
          ),
          _DecadeChip(
            label: labels.sixties,
            isSelected: selected == Decade.sixties,
            onTap: () => cubit.selectDecade(Decade.sixties),
          ),
          _DecadeChip(
            label: labels.seventies,
            isSelected: selected == Decade.seventies,
            onTap: () => cubit.selectDecade(Decade.seventies),
          ),
          _DecadeChip(
            label: labels.eighties,
            isSelected: selected == Decade.eighties,
            onTap: () => cubit.selectDecade(Decade.eighties),
          ),
          _DecadeChip(
            label: labels.nineties,
            isSelected: selected == Decade.nineties,
            onTap: () => cubit.selectDecade(Decade.nineties),
          ),
        ],
      ),
    );
  }
}

class _DecadeChip extends StatelessWidget {
  const _DecadeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fillColor = isSelected ? colors.forestGreen : Colors.transparent;
    final borderColor = isSelected ? colors.forestGreen : colors.forestGreen.withValues(alpha: 0.4);
    final labelColor = isSelected ? colors.onDark : colors.forestGreen;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: KSize.durationFast,
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: KSize.margin4x,
            vertical: KSize.margin2x,
          ),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(KSize.radiusOfRoundButton),
            border: Border.all(
              color: borderColor,
              width: KSize.borderWidthVerySmall,
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: labelColor,
              fontWeight: KSize.fontWeightMediumBold,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
