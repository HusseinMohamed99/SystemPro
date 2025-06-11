import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/features/Home/data/model/navBar/bottom_navigation_bar_model.dart';
import 'package:system_pro/features/Home/ui/main_widgets/navigation_bar_item.dart';

/// A customizable bottom navigation bar with adaptive theming
/// and support for active/inactive item states.
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
    final items = bottomNavBarItems(context);

    return Container(
     
      decoration: BoxDecoration( 
      color: customWhiteAndTertiaryBlackColor(context),
          borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      ),
    
      child: Container(
        width: double.infinity,
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = currentIndex == index;

            return Expanded(
              child: _NavigationBarItemWrapper(
                index: index,
                isSelected: isSelected,
                onTap: onItemTapped,
                entity: item,
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// Wraps each navigation item with interaction logic and animation support.
class _NavigationBarItemWrapper extends StatelessWidget {
  const _NavigationBarItemWrapper({
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.entity,
  });

  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;
  final BottomNavigationBarEntity entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(20.r),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: NavigationBarItem(
        isSelectedItem: isSelected,
        bottomNavigationBarEntity: entity,
      ),
    );
  }
}
