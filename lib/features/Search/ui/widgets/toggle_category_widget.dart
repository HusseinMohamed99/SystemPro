import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/filters.dart';
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

  final List<FilterType> filters;
  final List<String> enabledSlugs;
  final void Function(String selectedSlug) onCategoryChanged;

  @override
  State<ToggleCategoryWidget> createState() => _ToggleCategoryWidgetState();
}

class _ToggleCategoryWidgetState extends State<ToggleCategoryWidget> {
  late FilterType selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.filters.first;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialSlug = filterTypeValue(selectedType);
      if (widget.enabledSlugs.contains(initialSlug)) {
        widget.onCategoryChanged(initialSlug);
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
            widget.filters.map((type) {
              final displayName = filterTypeLabel(context, type);
              final slug = filterTypeValue(type);
              final isSelected = selectedType == type;
              final isEnabled = widget.enabledSlugs.contains(slug);

              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                  child: ChoiceChip(
                    key: ValueKey(type),
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
                              setState(() => selectedType = type);
                              widget.onCategoryChanged(slug);
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
