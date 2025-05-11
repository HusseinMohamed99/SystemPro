import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/data/model/bottom_navigation_bar_model.dart';
import 'package:system_pro/features/Home/ui/main_widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureWhite,
          darkColor: ColorManager.primaryBlack,
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
                    setState(() {
                      selectedIndex = index;
                      widget.onItemTapped(index);
                    });
                  },
                  child: NavigationBarItem(
                    isSelectedItem: selectedIndex == index,
                    bottomNavigationBarEntity: entity,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
