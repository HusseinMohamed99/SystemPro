import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing_image.dart';

class RealEstateDetailsImage extends StatefulWidget {
  const RealEstateDetailsImage({super.key, this.images});
  final List<ListingImage>? images;

  @override
  State<RealEstateDetailsImage> createState() => _RealEstateDetailsImageState();
}

class _RealEstateDetailsImageState extends State<RealEstateDetailsImage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250.h,
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
                imageURL: widget.images?[index].imageUrl ?? '',
                fit: BoxFit.fitWidth,
                height: 250.h,
              );
            },
          ),
        ),
        PositionedDirectional(
          top: context.height * .03,
          start: 20.w,
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: kPaddingSmallHorizontal.w,
                vertical: kPaddingSmallVertical.h,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: customWhiteAndTertiaryBlackColor(context),
                border: Border.all(
                  color: customBorderGreyAndTertiaryBlackColor(context),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16.sp,
                color: customBlackAndWhiteColor(context),
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 16.h,
          start: 0,
          end: 0,
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
                          ? customPrimaryAndSecondaryBlueColor(context)
                          : customSoftGreyAndWhiteColor(context),
                  borderRadius: BorderRadius.circular(kBorderRadiusRounded),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
