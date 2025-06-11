import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing_image.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';

/// Slider widget that displays listing images
///  with pagination and favorite button.
/// Includes optional Hero animation and layout adaptivity.
class RealEstateImageSlider extends StatefulWidget {
  const RealEstateImageSlider({
    super.key,
    required this.images,
    required this.listingId,
    required this.listing,
    this.onToggleFavorite,
    this.heroTag,
  });
  final List<ListingImage>? images;
  final int listingId;
  final Listing? listing;
  final void Function(Listing updatedListing)? onToggleFavorite;
  final String? heroTag; // Optional tag for Hero animation
  @override
  State<RealEstateImageSlider> createState() => _RealEstateImageSliderState();
}

class _RealEstateImageSliderState extends State<RealEstateImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isToggling = false; // ✅ Prevent double taps
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFavorite() async {
    if (widget.listing == null || _isToggling) return;
    setState(() => _isToggling = true); // ✅ Lock button
    final cubit = context.read<MarketplaceCubit>();
    final updated = await cubit.toggleFavorite(
      widget.listingId,
      listing: widget.listing,
      lang: context.localeCode,
    );
    if (updated != null) {
      final favCubit = context.read<FavoriteCubit>();
      updated.isFavorite
          ? favCubit.addToFavorites(updated)
          : favCubit.removeFromFavorites(updated.id!);
      widget.onToggleFavorite?.call(updated);
    }
    setState(() => _isToggling = false); // ✅ Unlock
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isFromCompanyProfile = currentRoute == Routes.sourceProfileView;
    final imageCount = widget.images?.length ?? 0;
    final fallbackImage = widget.listing?.pictureUrl ?? '';
    final imageSlider = ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: SizedBox(
        height: 150.h,
        width: context.width,
        child:
            imageCount == 0
                ? const Center(child: Text('No images available'))
                : PageView.builder(
                  controller: _pageController,
                  itemCount: imageCount,
                  onPageChanged:
                      (index) => setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final imageUrl =
                        widget.images?[index].imageUrl ?? fallbackImage;
                    return CustomCachedNetworkImageWidget(
                      fit: BoxFit.fitWidth,
                      width: context.width,
                      height: 150.h,
                      imageURL: imageUrl,
                    );
                  },
                ),
      ),
    );
    return Stack(
      children: [
        widget.heroTag != null
            ? Hero(tag: widget.heroTag!, child: imageSlider)
            : imageSlider,
        if (!isFromCompanyProfile)
          Positioned(
            top: 16.h,
            right: 16.w,
            child: GestureDetector(
              onTap: _toggleFavorite,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kPaddingSmallHorizontal.w,
                  vertical: kPaddingSmallVertical.h,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: customWhiteAndTertiaryBlackColor(context),
                ),
                child:
                    _isToggling
                        ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          ),
                        )
                        : BlocSelector<
                          MarketplaceCubit,
                          MarketplaceState,
                          bool?
                        >(
                          selector: (state) {
                            return state.maybeWhen(
                              success: (listings, _, _) {
                                return listings
                                    .firstWhere(
                                      (l) => l.id == widget.listingId,
                                      orElse:
                                          () => Listing(id: widget.listingId),
                                    )
                                    .isFavorite;
                              },
                              orElse: () => null,
                            );
                          },
                          builder: (context, isFavorited) {
                            final color =
                                isFavorited == true
                                    ? ColorManager.brightRed
                                    : customBlackAndHintGreyColor(context);
                            return Icon(
                              isFavorited == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: color,
                              size: kIconSizeDefault.sp,
                            );
                          },
                        ),
              ),
            ),
          ),
        if (imageCount > 1)
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageCount, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsetsDirectional.symmetric(
                    horizontal: kPaddingSmallerHorizontal.w,
                  ),
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? customPrimaryAndSecondaryBlueColor(context)
                            : ColorManager.softWhite,
                    borderRadius: BorderRadius.circular(kBorderRadiusRounded).r,
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
