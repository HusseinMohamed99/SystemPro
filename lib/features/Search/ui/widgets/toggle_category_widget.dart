import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ToggleCategoryWidget extends StatefulWidget {
  const ToggleCategoryWidget({
    super.key,
    required this.onCategoryChanged,
    required this.filters,
  });

  final Function(String selectedSlug) onCategoryChanged;
  final Map<String, String> filters;

  @override
  State<ToggleCategoryWidget> createState() => _ToggleCategoryWidgetState();
}

class _ToggleCategoryWidgetState extends State<ToggleCategoryWidget> {
  late String selectedDisplay;

  @override
  void initState() {
    super.initState();
    selectedDisplay = widget.filters.keys.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onCategoryChanged(widget.filters[selectedDisplay]!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.shadowBlue,
          darkColor: ColorManager.tertiaryBlack,
        ),
      ),
      child: Row(
        children:
            widget.filters.entries.map((entry) {
              final displayName = entry.key;
              final slug = entry.value;
              final isSelected = selectedDisplay == displayName;

              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: ChoiceChip(
                    key: ValueKey(displayName),
                    side: BorderSide(
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.shadowBlue,
                        darkColor: ColorManager.tertiaryBlack,
                      ),
                    ),
                    labelPadding: EdgeInsets.symmetric(vertical: 4.h),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        displayName,
                        textAlign: TextAlign.center,
                        style: context.titleLarge?.copyWith(
                          color:
                              isSelected
                                  ? ColorManager.pureWhite
                                  : AdaptiveColor.adaptiveColor(
                                    context: context,
                                    lightColor: ColorManager.primaryBlue,
                                    darkColor: ColorManager.iconGrey,
                                  ),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedDisplay = displayName;
                        widget.onCategoryChanged(slug);
                      });
                    
                  
                    },
                    selectedColor: ColorManager.primaryBlue,
                    backgroundColor: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.shadowBlue,
                      darkColor: ColorManager.tertiaryBlack,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                        color: AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.borderGrey,
                          darkColor: ColorManager.tertiaryBlack,
                        ),
                      ),
                    ),
                    showCheckmark: false,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
