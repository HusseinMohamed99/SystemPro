import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketer.dart';
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
    final borderRadius = BorderRadius.circular(16);
    final backgroundColor = AdaptiveColor.adaptiveColor(
      context: context,
      lightColor: ColorManager.pureWhite,
      darkColor: ColorManager.tertiaryBlack,
    );

    return Card(
      // ✅ Key includes listing.id only (not isFavorite) to reduce rebuild noise
      key: ValueKey(listing.id),
      margin: EdgeInsets.only(bottom: 12.h),
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.borderGrey,
              darkColor: ColorManager.tertiaryBlack,
            ),
            width: 1.5.w,
          ),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Image Section (Hero optional)
            if (showImage)
              (heroTag != null)
                  ? Hero(tag: heroTag!, child: _buildImageSlider(context))
                  : _buildImageSlider(context),

            verticalSpacing(kSpacingSmall),

            // ℹ️ Real estate details (info block)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: RealEstateInfo(
                price: listing.price ?? '',
                location: listing.location ?? '',
                title: listing.title ?? '',
                bedroomNum: listing.rooms.toString(),
                bathroomNum: listing.bathrooms.toString(),
                area: listing.area.toString(),
                dateTime: listing.createdAt.toString(),
                company: listing.company ?? const Company(),
                marketer: listing.marketer ?? const Marketer(),
              ),
            ),

            verticalSpacing(kSpacingSmall),
          ],
        ),
      ),
    );
  }

  /// Builds the real estate image slider with toggle callback
  Widget _buildImageSlider(BuildContext context) {
    return RealEstateImageSlider(
      images: listing.images,
      listingId: listing.id ?? 0,
      listing: listing,
      
    );
  }

}