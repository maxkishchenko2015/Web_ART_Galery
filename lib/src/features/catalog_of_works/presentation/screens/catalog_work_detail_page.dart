import 'package:flutter/material.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';

class CatalogWorkDetailPage extends StatelessWidget {
  const CatalogWorkDetailPage({super.key, required this.workId});

  final String workId;

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(title: '${context.t.catalog.workPrefix}: $workId');
  }
}
