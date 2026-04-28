import 'package:flutter/material.dart';
import 'package:web_art_galery/src/features/films/presentation/widgets/films_section.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: FilmsSection());
  }
}
