import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/data/model/bottom_navigation_bar_model.dart';
import 'package:system_pro/features/Home/ui/main_widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 70.h,
      decoration: ShapeDecoration(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.primaryBlack,
            ),
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children:
            bottomNavBarItems(context).asMap().entries.map((entry) {
              final index = entry.key;
              final entity = entry.value;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    onItemTapped(
                      index,
                    );
                  },
                  child: NavigationBarItem(
                    isSelectedItem: currentIndex == index,
                    bottomNavigationBarEntity: entity,
                    
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
