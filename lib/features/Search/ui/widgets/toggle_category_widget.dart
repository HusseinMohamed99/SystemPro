import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ToggleCategoryWidget extends StatefulWidget {
  const ToggleCategoryWidget({
    super.key,
    required this.onCategoryChanged,
    required this.filters,
    required this.enabledSlugs,
  });

  final Function(String selectedSlug) onCategoryChanged;
  final Map<String, String> filters;
  final List<String> enabledSlugs;

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
        final initialSlug = widget.filters[selectedDisplay]!;
        if (widget.enabledSlugs.contains(initialSlug)) {
          widget.onCategoryChanged(initialSlug);
        }
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
              final isEnabled = widget.enabledSlugs.contains(slug);

              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: ChoiceChip(
                    key: ValueKey(displayName),
                    labelPadding: EdgeInsetsDirectional.symmetric(
                      vertical: 4.h,
                    ),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        displayName,
                        textAlign: TextAlign.center,
                        style: context.titleLarge?.copyWith(
                          color:
                              isSelected
                                  ? ColorManager.pureWhite
                                  : isEnabled
                                  ? AdaptiveColor.adaptiveColor(
                                    context: context,
                                    lightColor: ColorManager.primaryBlue,
                                    darkColor: ColorManager.iconGrey,
                                  )
                                  : ColorManager.iconGrey,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),
                    selected: isSelected,
                    onSelected:
                        isEnabled
                            ? (_) {
                              setState(() {
                                selectedDisplay = displayName;
                                widget.onCategoryChanged(slug);
                              });
                            }
                            : null,
                    selectedColor: ColorManager.primaryBlue,
                    backgroundColor: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.shadowBlue,
                      darkColor: ColorManager.tertiaryBlack,
                    ),
                    disabledColor: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.shadowBlue,
                      darkColor: ColorManager.darkGrey,
                    ),
                    side: BorderSide(
                      width: 0,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.pureWhite,
                        darkColor: ColorManager.tertiaryBlack,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
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
