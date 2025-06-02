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

/// Widget that displays a real estate item, supporting grid/list layout and hero animation.
class RealEstateItem extends StatelessWidget {
  const RealEstateItem({
    super.key,
    required this.listing,
    required this.index,
    this.onToggleFavorite,
    this.useGridLayout = false,
  });

  final Listing listing;
  final int index;
  final bool useGridLayout;
  final void Function(Listing updatedListing)? onToggleFavorite;

  void _defaultFavoriteToggle(BuildContext context, Listing updatedListing) {
    context.read<FavoriteCubit>().toggleFavorite(
      updatedListing.id!,
      listing: updatedListing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    final backgroundColor = AdaptiveColor.adaptiveColor(
      context: context,
      lightColor: ColorManager.pureWhite,
      darkColor: ColorManager.tertiaryBlack,
    );

    return Card(
      key: ValueKey('${listing.id}-${listing.isFavorite}'),
      margin: useGridLayout ? EdgeInsets.zero : EdgeInsets.only(bottom: 12.h),
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
            Hero(
              tag: 'listing-image-${listing.id}',
              child: RealEstateImageSlider(
                images: listing.images,
                listingId: listing.id ?? 0,
                listing: listing,
                onToggleFavorite: (updatedListing) {
                  if (onToggleFavorite != null) {
                    onToggleFavorite!(updatedListing);
                  } else {
                    _defaultFavoriteToggle(context, updatedListing);
                  }
                },
              ),
            ),
            verticalSpacing(kSpacingSmall),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: useGridLayout ? 8.w : 12.w,
              ),
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
}
