import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
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
    return BlocBuilder<MarketplaceCubit, MarketplaceState>(
      builder: (context, state) {
        if (state is MarketPlaceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MarketPlaceError) {
          return CustomErrorWidget(errorMessage: state.error);
        } else if (state is MarketPlaceSuccess) {
          final listings = state.listings;

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
              Divider(
                color: ColorManager.borderGrey,
                thickness: 1,
                height: 1.h,
              ),
              ResultsCountAndSortButton(
                propertyLength: listings.length.toString(),
              ).onlyPadding(
                leftPadding: kPaddingDefaultHorizontal,
                rightPadding: kPaddingDefaultHorizontal,
                topPadding: kPaddingDefaultVertical,
              ),
              Expanded(
                child:
                    listings.isEmpty
                        ? const Center(
                          child: Text('لا توجد عقارات متاحة حالياً'),
                        )
                        : NotificationListener<ScrollNotification>(
                          onNotification: (scrollInfo) {
                            if (scrollInfo.metrics.pixels >=
                                scrollInfo.metrics.maxScrollExtent - 200) {
                              context.read<MarketplaceCubit>().loadMore();
                            }
                            return false;
                          },
                          child: CustomScrollView(
                            slivers: [RealEstateSliverList(listings: listings)],
                          ),
                        ).onlyPadding(
                          leftPadding: kPaddingDefaultHorizontal,
                          rightPadding: kPaddingDefaultHorizontal,
                          topPadding: kPaddingDefaultVertical,
                        ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink(); // fallback for unknown states
        }
      },
    );
  }
}

