import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/archive/presentation/widgets/archive_news_section.dart';

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
    return const SingleChildScrollView(child: ArchiveNewsSection());
  }
}
