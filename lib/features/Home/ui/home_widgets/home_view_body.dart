import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Home/ui/home_widgets/property_filters_row.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';
import 'package:system_pro/features/Home/ui/home_widgets/search_bar_with_filter_button.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarWithFilterButton().allPadding(
          vPadding: kPaddingDefaultVertical,
          hPadding: kPaddingDefaultHorizontal,
        ),
        const PropertyFiltersRow().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          bottomPadding: kPaddingDefaultVertical,
        ),
        Divider(
          color: ColorManager.borderGrey,
          thickness: 1,
          height: 1.h,
        ),
        const ResultsCountAndSortButton().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          topPadding: kPaddingDefaultVertical,
        ),
        Expanded(
          child: const CustomScrollView(
            slivers: [RealEstateSliverList()],
          ).onlyPadding(
            leftPadding: kPaddingDefaultHorizontal,
            rightPadding: kPaddingDefaultHorizontal,
            topPadding: kPaddingDefaultVertical,
          ),
        ),
      ],
    );
  }
}
