import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/listing_image.dart';

class RealEstateImageSlider extends StatefulWidget {
  const RealEstateImageSlider({super.key, required this.images});
  final List<ListingImage>? images;
  @override
  State<RealEstateImageSlider> createState() => _RealEstateImageSliderState();
}

class _RealEstateImageSliderState extends State<RealEstateImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool isFavorite = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image slider
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: SizedBox(
            height: 150.h,
            width: context.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images?.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return CustomCachedNetworkImageWidget(
                  fit: BoxFit.fill,
                  width: context.width,
                  height: 150.h,
                  imageURL: widget.images?[index].imageUrl??'',
                );
              },
            ),
          ),
        ),

        // Favorite Icon (toggling)
        Positioned(
          top: 16.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingSmallHorizontal.w,
                vertical: kPaddingSmallVertical.h,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.pureWhite,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color:
                    isFavorite
                        ? ColorManager.brightRed
                        : ColorManager.pureBlack,
                size: kIconSizeDefault.sp,
              ),
            ),
          ),
        ),
        // Dots Indicator
        Positioned(
          bottom: 8.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images?.length??0, (index) {
              final isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      isActive
                          ? ColorManager.primaryBlue
                          : ColorManager.pureWhite,
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
