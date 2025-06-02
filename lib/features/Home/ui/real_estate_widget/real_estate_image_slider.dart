import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing_image.dart';

/// A slider that displays real estate listing images with a favorite button.
class RealEstateImageSlider extends StatefulWidget {
  const RealEstateImageSlider({
    super.key,
    required this.images,
    required this.listingId,
    required this.listing,
    this.onToggleFavorite,
  });

  final List<ListingImage>? images;
  final int listingId;
  final Listing? listing;
  final void Function(Listing updatedListing)? onToggleFavorite;

  @override
  State<RealEstateImageSlider> createState() => _RealEstateImageSliderState();
}

class _RealEstateImageSliderState extends State<RealEstateImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  /// Local state copy of the listing to track favorite changes visually
  late Listing _localListing;

  @override
  void initState() {
    super.initState();
    _localListing = widget.listing ?? Listing(); // fallback if null
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Toggles favorite status locally and notifies parent
  void _toggleFavorite() {
    final updated = _localListing.copyWith(
      isFavorite: !_localListing.isFavorite,
    );
    widget.onToggleFavorite?.call(updated);
    setState(() => _localListing = updated);
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images ?? [];
    final isFromCompanyProfile =
        ModalRoute.of(context)?.settings.name == Routes.companyProfileView;

    return Stack(
      children: [
        // Main image slider
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: SizedBox(
            height: 150.h,
            width: context.width,
            child:
                images.isEmpty
                    ? const Center(child: Text('No images available'))
                    : PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      itemBuilder:
                          (context, index) => CustomCachedNetworkImageWidget(
                            fit: BoxFit.fitWidth,
                            width: context.width,
                            height: 150.h,
                            imageURL:
                                images[index].imageUrl ??
                                _localListing.pictureUrl ??
                                '',
                          ),
                    ),
          ),
        ),

        // Favorite icon (unless we're in company profile view)
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
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.softWhite,
                    darkColor: ColorManager.tertiaryBlack,
                  ),
                ),
                child: Icon(
                  _localListing.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      _localListing.isFavorite
                          ? ColorManager.brightRed
                          : AdaptiveColor.adaptiveColor(
                            context: context,
                            lightColor: ColorManager.tertiaryBlack,
                            darkColor: ColorManager.hintGrey,
                          ),
                  size: kIconSizeDefault.sp,
                ),
              ),
            ),
          ),

        // Pagination dots (if more than 1 image)
        if (images.length > 1)
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? AdaptiveColor.adaptiveColor(
                              context: context,
                              lightColor: ColorManager.primaryBlue,
                              darkColor: ColorManager.secondaryBlue,
                            )
                            : AdaptiveColor.adaptiveColor(
                              context: context,
                              lightColor: ColorManager.softWhite,
                              darkColor: ColorManager.pureWhite,
                            ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
