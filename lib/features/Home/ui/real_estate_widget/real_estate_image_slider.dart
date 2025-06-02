import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing_image.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';

/// Slider widget that displays listing images with pagination and favorite button.
/// Includes Hero animation and adaptive layout support.
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFavorite() async {
    if (widget.listing == null) return;

    final cubit = context.read<MarketplaceCubit>();
    final updated = await cubit.toggleFavorite(
      widget.listingId,
      listing: widget.listing,
    );

    if (updated != null) {
      final favCubit = context.read<FavoriteCubit>();

      if (updated.isFavorite) {
        favCubit.addToFavorites(updated); // ✅ أضف للمفضلة يدويًا
      } else {
        favCubit.removeFromFavorites(updated.id!); // ✅ إحذف منها يدويًا
      }

      setState(() {}); // ✅ لتحديث الأيقونة
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isFromCompanyProfile = currentRoute == Routes.companyProfileView;
    final imageCount = widget.images?.length ?? 0;
    final fallbackImage = widget.listing?.pictureUrl ?? '';

    return Stack(
      children: [
        ClipRRect(
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
        ),

        // ❤️ Favorite Icon Button
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
                child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
                  buildWhen: (prev, curr) => curr is MarketPlaceSuccess,
                  builder: (context, state) {
                    final updatedListing = state.maybeWhen(
                      success:
                          (listings, _) => listings.firstWhere(
                            (l) => l.id == widget.listingId,
                            orElse: () => widget.listing!,
                          ),

                      orElse: () => widget.listing!,
                    );

                    final isFavorited = updatedListing.isFavorite;

                    return Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color:
                          isFavorited
                              ? ColorManager.brightRed
                              : AdaptiveColor.adaptiveColor(
                                context: context,
                                lightColor: ColorManager.tertiaryBlack,
                                darkColor: ColorManager.hintGrey,
                              ),
                      size: kIconSizeDefault.sp,
                    );
                  },
                ),
              ),
            ),
          ),

        // 🔘 Image Indicators
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
