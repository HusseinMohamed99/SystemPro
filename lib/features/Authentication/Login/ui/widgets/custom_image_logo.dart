import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/gen/assets.gen.dart';

class CustomImageLogo extends StatelessWidget {
  const CustomImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.logoTest,
      alignment: AlignmentDirectional.topStart,
    );
  }
}
