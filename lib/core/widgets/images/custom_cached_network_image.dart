import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/gen/assets.gen.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  const CustomCachedNetworkImageWidget({
    super.key,
    required this.imageURL,
    this.width,
    this.height,
    this.fit,
  });

  final String? imageURL;
  final double? width, height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl:
          imageURL?.isNotEmpty == true
              ? imageURL!
              : 'https://firebasestorage.googleapis.com/v0/b/fakahani-73130.firebasestorage.app/o/Dummy%2Fic_launcher_foreground.png?alt=media&token=bdb0f62e-0b2e-47bb-b4f8-be6e19b5a808',
      placeholder:
          (context, url) => const Center(
            child: SpinKitDoubleBounce(
              color: ColorManager.primaryBlue,
              duration: Duration(milliseconds: 3000),
            ),
          ),
      errorWidget:
          (context, url, error) => SvgPicture.asset(
            Assets.images.error,
            fit: BoxFit.fitWidth,
            width: width,
            height: height ?? 90.h,
          ),
    );
  }
}
