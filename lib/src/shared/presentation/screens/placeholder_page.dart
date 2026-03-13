import 'package:flutter/material.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.maxWidth < KSize.adaptiveCompactBreakpoint
            ? KSize.margin4x
            : KSize.margin8x;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: KSize.contentMaxWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}
