import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({required this.child, this.isBlur = true, this.sigma = 5.0});

  final Widget child;
  final bool isBlur;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    if (!isBlur) return child;

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        child,
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigma,
            sigmaY: sigma,
          ),
          child: Container(
              // color: Colors.white.withOpacity(0.1),
              ),
        ),
      ],
    );
  }
}
