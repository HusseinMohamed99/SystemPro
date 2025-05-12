import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ToggleCategoryWidget extends StatefulWidget {
  const ToggleCategoryWidget({super.key, required this.onCategoryChanged});

  final Function(String) onCategoryChanged;

  @override
  State<ToggleCategoryWidget> createState() => _ToggleCategoryWidgetState();
}

class _ToggleCategoryWidgetState extends State<ToggleCategoryWidget> {
  late String selectedFilter;

  List<String> filters(BuildContext context) => [
    context.localization.residentail,
    context.localization.commercial,
    context.localization.lands,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter = context.localization.residentail;
  }

  @override
  Widget build(BuildContext context) {
    final allFilters = filters(context);

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
            allFilters.map((filter) {
              final isSelected = selectedFilter == filter;
              return Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end:
                        selectedFilter == context.localization.residentail &&
                                isSelected
                            ? 8.w
                            : 0,
                    start:
                        selectedFilter == context.localization.commercial &&
                                isSelected
                            ? 8.w
                            : 0,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: ChoiceChip(
                      key: ValueKey(filter),
                      side: BorderSide(
                        color:  AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.shadowBlue,
                          darkColor: ColorManager.tertiaryBlack,
                        ),
                      ),
                      labelPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 4.h,
                      ),
                      label: SizedBox(
                        width: double.infinity,
                        child: Text(
                          filter,
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
                          selectedFilter = filter;
                          widget.onCategoryChanged(selectedFilter);
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
                ),
              );
            }).toList(),
      ),
    );
  }
}
