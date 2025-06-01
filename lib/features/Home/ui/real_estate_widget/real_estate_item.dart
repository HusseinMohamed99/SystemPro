import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketer.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_info.dart';

class RealEstateItem extends StatefulWidget {
  const RealEstateItem({
    super.key,
    required this.listing,
    required this.index,
    this.onToggleFavorite,
  });

  final Listing listing;
  final int index;
  final VoidCallback? onToggleFavorite;

  @override
  State<RealEstateItem> createState() => _RealEstateItemState();
}

class _RealEstateItemState extends State<RealEstateItem> {
 void _handleFavoriteToggle(Listing updatedListing) {
    context.read<FavoriteCubit>().toggleFavorite(
      updatedListing.id!,
      listing: updatedListing,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      color: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.borderGrey,
        darkColor: ColorManager.tertiaryBlack,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.borderGrey,
              darkColor: ColorManager.tertiaryBlack,
            ),
            width: 1.5.w,
          ),
          color: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.pureWhite,
            darkColor: ColorManager.tertiaryBlack,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RealEstateImageSlider(
              images: widget.listing.images,
              listingId: widget.listing.id ?? 0,
              listing: widget.listing,
              onToggleFavorite: _handleFavoriteToggle,
            ),
            verticalSpacing(kSpacingSmall),
            RealEstateInfo(
              price: widget.listing.price ?? '',
              location: widget.listing.location ?? '',
              title: widget.listing.title ?? '',
              bedroomNum: widget.listing.rooms.toString(),
              bathroomNum: widget.listing.bathrooms.toString(),
              area: widget.listing.area.toString(),
              dateTime: widget.listing.createdAt.toString(),
              company: widget.listing.company ?? const Company(),
              marketer: widget.listing.marketer?? const Marketer(),
            ),
          ],
        ),
      ),
    );
  }
}
