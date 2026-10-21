import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/archive/presentation/cubits/archive_cubit.dart';
import 'package:web_art_galery/src/features/archive/presentation/widgets/archive_news_section.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cubit_initializer.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.archive.title)
        ..description(description: context.t.seo.archive.description)
        ..keywords(keywords: context.t.seo.archive.keywords);
    }
    return CubitInitializer(
      onInit: (context) => context.read<ArchiveCubit>().load(),
      // Top inset clears the mobile shell's floating app bar (0 on desktop).
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: const ArchiveNewsSection(),
      ),
    );
  }
}
