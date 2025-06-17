import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';

class ImageWithDottedBorder extends StatelessWidget {
  const ImageWithDottedBorder({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.dotColors = const [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
    ],
    this.borderRadius,
  });

  final String? imageUrl;
  final double size;
  final List<Color> dotColors;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final double finalRadius = borderRadius ?? (size / 2).r;
return CustomPaint(
      painter: _MultiColorDottedPainter(dotColors: dotColors),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(finalRadius),
        child: SizedBox(
          height: size.h,
          width: size.w,
          child: CustomCachedNetworkImageWidget(
            imageURL: imageUrl ?? '',
            fit: BoxFit.cover,
            width: size.w,
            height: size.h,
          ),
        ),
      ),
    );

  }
}

class _MultiColorDottedPainter extends CustomPainter {
  _MultiColorDottedPainter({required this.dotColors});

  final List<Color> dotColors;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..strokeWidth = 2.w
          ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    final double circumference = 2 * pi * radius;

    const double gap = 5;
    final int dotsCount = (circumference / gap).floor();

    for (int i = 0; i < dotsCount; i++) {
      final double angle = (2 * pi * i) / dotsCount;
      final double dx = center.dx + radius * cos(angle);
      final double dy = center.dy + radius * sin(angle);

      paint.color = dotColors[i % dotColors.length];
      canvas.drawCircle(Offset(dx, dy), 1.5.w, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
