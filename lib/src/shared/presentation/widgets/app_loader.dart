import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web_art_galery/src/shared/config/app_context_extensions.dart';
import 'package:web_art_galery/src/shared/config/ksize.dart';

/// App-wide loading indicator — a `flutter_spinkit` [SpinKitCubeGrid] in the
/// brand forest-green, replacing the stock Material `CircularProgressIndicator`
/// everywhere (page/route loading states and image placeholders).
///
/// [size] and [color] override the defaults for the rare call site that needs
/// a different footprint or a loader on a dark surface.
class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size, this.color});

  /// Diameter of the cube grid. Defaults to [KSize.loaderSize].
  final double? size;

  /// Cube color. Defaults to the brand forest-green.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitCubeGrid(
      color: color ?? context.colors.forestGreen,
      size: size ?? KSize.loaderSize,
    );
  }
}
