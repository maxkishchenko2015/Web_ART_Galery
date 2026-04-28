import 'package:flutter/material.dart';
import 'package:web_art_galery/src/features/archive/presentation/widgets/archive_news_section.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: ArchiveNewsSection());
  }
}
