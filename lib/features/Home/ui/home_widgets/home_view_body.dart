import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/property_filters_row.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchTextField().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          bottomPadding: kPaddingVertical,
          topPadding: kPaddingDefaultVertical,
        ),
        const PropertyFiltersRow().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          bottomPadding: kPaddingVertical,
        ),
        Divider(color: ColorManager.borderGrey, thickness: 1, height: 1.h),
        const ResultsCountAndSortButton().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          topPadding: kPaddingDefaultVertical,
        ),
        Expanded(
          child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Welcome!')),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (listings) {
                  return CustomScrollView(
                    slivers: [RealEstateSliverList(listings: listings)],
                  );
                },
                filtered: (filteredListings) {
                  return CustomScrollView(
                    slivers: [RealEstateSliverList(listings: filteredListings)],
                  );
                },
                error: (message) => Center(child: Text('Error: $message')),
              );
            },
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
