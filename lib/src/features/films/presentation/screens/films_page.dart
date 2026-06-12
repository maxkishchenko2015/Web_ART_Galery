import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:web_art_galery/i18n/strings.g.dart';
import 'package:web_art_galery/src/features/films/presentation/cubits/films_cubit.dart';
import 'package:web_art_galery/src/features/films/presentation/widgets/films_section.dart';
import 'package:web_art_galery/src/shared/presentation/widgets/cubit_initializer.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO()
        ..ogTitle(ogTitle: context.t.seo.films.title)
        ..description(description: context.t.seo.films.description)
        ..keywords(keywords: context.t.seo.films.keywords);
    }
    return CubitInitializer(
      onInit: (context) => context.read<FilmsCubit>().load(),
      child: const SingleChildScrollView(child: FilmsSection()),
    );
  }
}
