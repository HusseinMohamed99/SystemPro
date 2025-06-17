import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

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

  final String? imageURL;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? customLoadingWidget;
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
      errorWidget: (context, url, error) {
        return FutureBuilder<Uint8List?>(
          future: _fetchImageBytes(url),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customLoadingWidget ?? _buildLoadingIndicator();
            }

            if (snapshot.hasData && snapshot.data != null) {
              return Image.memory(
                snapshot.data!,
                fit: fit ?? BoxFit.cover,
                width: width,
                height: height,
                errorBuilder:
                    (_, __, ___) =>
                        customErrorWidget ?? _buildErrorWidget(context),
              );
            }

            return customErrorWidget ?? _buildErrorWidget(context);
          },
        );
      },
    );
  }

  bool get _isImageUrlEmpty => imageURL == null || imageURL!.trim().isEmpty;

  Widget _buildLoadingIndicator() {
    return Center(
      child: SpinKitDoubleBounce(
        color: ColorManager.primaryBlue,
        size: 40.sp,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

Widget _buildErrorWidget(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final fallbackWidth = width ?? 80.w;
    final fallbackHeight = height ?? 60.h;

    return Container(
      width: fallbackWidth,
      height: fallbackHeight,
      color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        size: 30.sp,
        color: ColorManager.hintGrey,
      ),
    );
  }


  Future<Uint8List?> _fetchImageBytes(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 5)); // ✅ Timeout added

      if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
        return response.bodyBytes;
      } else {
        if (kDebugMode) {
          debugPrint('Image fetch failed: HTTP ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Exception while fetching image: $e');
      }
    }

    return null;
  }
}
