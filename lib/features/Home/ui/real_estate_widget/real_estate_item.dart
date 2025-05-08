import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_info.dart';

class RealEstateItem extends StatelessWidget {
  const RealEstateItem({
    super.key,
    required this.listing,
    required this.index,
    required this.isFavorite,
  });
  final Listing listing;
  final int index;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
          color: ColorManager.pureWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RealEstateImageSlider(
              images: listing.images,
              isFavorite: isFavorite,
              listingId: listing.id ?? 0,
              listing: listing,
            ),
            verticalSpacing(kSpacingSmall),
            RealEstateInfo(
              price: listing.price ?? '',
              location: listing.location ?? '',
              title: listing.title ?? '',
              bedroomNum: listing.rooms.toString(),
              bathroomNum: listing.bathrooms.toString(),
              area: listing.area.toString(),
              dateTime: listing.createdAt.toString(),
              company: listing.company ?? Company(),
            ),
          ],
        ),
      ),
    );
  }
}
