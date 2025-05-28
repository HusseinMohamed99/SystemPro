import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/gen/assets.gen.dart';

/// A reusable and responsive widget for displaying the app logo.
class CustomImageLogo extends StatelessWidget {
  const CustomImageLogo({
    super.key,
    this.width,
    this.height,
    this.alignment = AlignmentDirectional.topStart,
    this.fit = BoxFit.contain,
    this.semanticLabel = 'App Logo',
  });

  /// Optional custom width
  final double? width;

  /// Optional custom height
  final double? height;

  /// Alignment of the logo inside its parent
  final AlignmentGeometry alignment;

  /// How the logo fits inside the given box
  final BoxFit fit;

  /// Accessibility label for screen readers
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.logoTest,
      fit: fit,
      alignment: alignment,
      semanticsLabel: semanticLabel,
    );
  }
}
