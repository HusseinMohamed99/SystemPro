import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

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
      fit: fit ?? BoxFit.fitWidth,
      imageUrl: imageURL?.isNotEmpty == true ? imageURL! : '',
      placeholder:
          (context, url) => const Center(
            child: SpinKitDoubleBounce(
              color: ColorManager.primaryBlue,
              duration: Duration(milliseconds: 3000),
            ),
          ),
      errorWidget:
          (context, url, error) => Icon(
            Icons.error,
            size: 40.sp,
            // size: 50.sp,
            color: ColorManager.primaryBlue,
          ),
    );
  }
}
