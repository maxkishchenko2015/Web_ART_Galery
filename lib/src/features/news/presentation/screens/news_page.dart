import 'package:flutter/material.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/shared/presentation/screens/placeholder_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(title: context.t.navigation.news);
  }
}
