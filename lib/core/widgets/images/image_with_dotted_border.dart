import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';

class ImageWithDottedBorder extends StatelessWidget {
  const ImageWithDottedBorder({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MultiColorDottedPainter(),
      child: SizedBox(
        height: 40.h,
        width: 40.w,
        child: CustomCachedNetworkImageWidget(
          imageURL: imageUrl ?? '',
          fit: BoxFit.cover,
        ),
      ).clipRRect(borderRadius: BorderRadius.circular(50).r),
    );
  }
}

class _MultiColorDottedPainter extends CustomPainter {
  final List<Color> dotColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..strokeWidth = 2.w
          ..style = PaintingStyle.stroke;

    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final circumference = 2 * 3.1416 * radius;

    const double gap = 4;
    final int dotsCount = (circumference / gap).floor();

    for (int i = 0; i < dotsCount; i++) {
      final angle = (2 * 3.1416 * i) / dotsCount;
      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      paint.color = dotColors[i % dotColors.length];
      canvas.drawCircle(Offset(dx, dy), 1.5.w, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
