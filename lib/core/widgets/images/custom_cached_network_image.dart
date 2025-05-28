import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A flexible, reusable image widget that
///  loads network images with caching support.
/// Includes default loading and error widgets,
///  with the ability to customize both.
class CustomCachedNetworkImageWidget extends StatelessWidget {
  const CustomCachedNetworkImageWidget({
    super.key,
    required this.imageURL,
    this.width,
    this.height,
    this.fit,
    this.customErrorWidget,
    this.customLoadingWidget,
  });

  /// URL of the image to load.
  final String? imageURL;

  /// Desired width of the image.
  final double? width;

  /// Desired height of the image.
  final double? height;

  /// BoxFit strategy for the image.
  final BoxFit? fit;

  /// Optional widget to show while the image is loading.
  final Widget? customLoadingWidget;

  /// Optional widget to show when the image fails to load.
  final Widget? customErrorWidget;

  @override
  Widget build(BuildContext context) {
    if (_isImageUrlEmpty) return _buildErrorWidget(context);

    return CachedNetworkImage(
      imageUrl: imageURL!,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder:
          (context, url) => customLoadingWidget ?? _buildLoadingIndicator(),
      errorWidget:
          (context, url, error) =>
              customErrorWidget ?? _buildErrorWidget(context),
    );
  }

  /// Checks if the imageURL is null or empty.
  bool get _isImageUrlEmpty => imageURL == null || imageURL!.trim().isEmpty;

  /// Default loading spinner widget.
  Widget _buildLoadingIndicator() {
    return Center(
      child: SpinKitDoubleBounce(
        color: ColorManager.primaryBlue,
        size: 40.sp,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  /// Default error widget with fallback icon and background.
  Widget _buildErrorWidget(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: width,
      height: height,
      color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        size: 30.sp,
        color: ColorManager.hintGrey,
      ),
    );
  }
}
