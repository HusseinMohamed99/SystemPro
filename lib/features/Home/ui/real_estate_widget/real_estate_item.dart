import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_info.dart';

/// Widget that displays a real estate item, supporting grid/list layout and hero animation.
class RealEstateItem extends StatelessWidget {
  const RealEstateItem({
    super.key,
    required this.listing,
    required this.index,
    this.heroTag,
    this.showImage = true,
  });

  final Listing listing;
  final int index;
  final bool showImage;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(kBorderRadiusDefault).r;

    return Card(
      key: ValueKey(
        listing.id,
      ), // Key by ID only (not isFavorite) for stability
      margin: EdgeInsetsDirectional.only(bottom: kPaddingSmallVertical.h),
      color: customWhiteAndTertiaryBlackColor(context),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: customBorderGreyAndTertiaryBlackColor(context),
          ),
          color: customWhiteAndTertiaryBlackColor(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Image Section (optional Hero animation)
            if (showImage)
              (heroTag != null)
                  ? Hero(tag: heroTag!, child: _buildImageSlider(context))
                  : _buildImageSlider(context),

            // ℹ️ Real estate details (price, title, specs, contact)
            RealEstateInfo(listing: listing).allPadding(
              vPadding: kPaddingSmallVertical,
              hPadding: kPaddingMediumHorizontal,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the real estate image slider with passed listing
  Widget _buildImageSlider(BuildContext context) {
    return RealEstateImageSlider(
      images: listing.images,
      listingId: listing.id ?? 0,
      listing: listing,
    );
  }
}
