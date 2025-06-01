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
import 'package:system_pro/features/Home/logic/Favorite/favorite_state.dart';

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
final void Function(Listing updatedListing)? onToggleFavorite; // ✅

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
void _toggleFavorite() {
    if (widget.listing == null) return;

    final updatedListing = widget.listing!.copyWith(
      isFavorite: !widget.listing!.isFavorite,
    );

    widget.onToggleFavorite?.call(updatedListing); // ✅ يعمل الآن

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isFromCompanyProfile = currentRoute == Routes.companyProfileView;

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
                widget.images == null || widget.images!.isEmpty
                    ? const Center(child: Text('No images available'))
                    : PageView.builder(
                      controller: _pageController,
                      itemCount: widget.images?.length ?? 0,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return CustomCachedNetworkImageWidget(
                          fit: BoxFit.fitWidth,
                          width: context.width,
                          height: 150.h,
                          imageURL:
                              widget.images?[index].imageUrl ??
                              widget.listing?.pictureUrl ??
                              '',
                        );
                      },
                    ),
          ),
        ),
      if (!isFromCompanyProfile)
        Positioned(
          top: 16.h,
          right: 16.w,
          child: GestureDetector(
            onTap: _toggleFavorite,
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
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
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                buildWhen: (previous, current) => current is GetFavoriteSuccess,
                builder: (context, state) {
                  final isFavorited = widget.listing?.isFavorite ?? false;

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
        if ((widget.images?.length ?? 0) > 1)
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images?.length ?? 0, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
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
