import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/gen/assets.gen.dart';


class RealEstateDetailsImage extends StatefulWidget {
  const RealEstateDetailsImage({super.key});

  @override
  State<RealEstateDetailsImage> createState() => _RealEstateDetailsImageState();
}

class _RealEstateDetailsImageState extends State<RealEstateDetailsImage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> imagePaths = [
    Assets.images.image1.path,
    Assets.images.image1.path,
    Assets.images.image1.path,
  ];

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
            height: 250.h,
            width: context.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.fill,
                  height: 250.h,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: context.height * .07,
          left: 20.w,
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingSmallHorizontal.w,
                vertical: kPaddingSmallVertical.h,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.pureWhite,
              ),
              child: Icon(Icons.arrow_back_ios_new, size: 16.sp),
            ),
          ),
        ),
        // Dots Indicator
        Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imagePaths.length, (index) {
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
