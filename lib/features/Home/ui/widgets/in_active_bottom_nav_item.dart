import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';

class InactiveNavigationItem extends StatelessWidget {
  const InactiveNavigationItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      width: context.width,
      height: context.height,
      child: SvgPicture.asset(icon),
    );
  }
}
