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
    if (imageURL == null || imageURL!.isEmpty) {
      return _errorWidget(context);
    }

    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit ?? BoxFit.fitWidth,
      imageUrl: imageURL!,
      placeholder: (context, url) => _loadingIndicator(),
      errorWidget: (context, url, error) => _errorWidget(context),
    );
  }

  /// 🔄 Indicator for loading
  Widget _loadingIndicator() {
    return Center(
      child: SpinKitDoubleBounce(
        color: ColorManager.primaryBlue,
        size: 40.sp,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  /// ❌ Widget when image fails to load
  Widget _errorWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        size: 30.sp,
        color: ColorManager.hintGrey,
      ),
    );
  }
}
