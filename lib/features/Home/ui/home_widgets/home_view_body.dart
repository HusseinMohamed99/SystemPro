import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/listings_list_widget.dart';
import 'package:system_pro/features/Home/ui/home_widgets/property_filters_row.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';

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
        Expanded(
          child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
            builder: (context, state) {
              if (state is MarketPlaceLoading) {
                return const AdaptiveIndicator();
              }
              if (state is MarketPlaceError) {
                return CustomErrorTextWidget(errorMessage: state.error);
              }
              if (state is MarketPlaceSuccess) {
                final listings = state.listings;
                return Column(
                  children: [
                    PropertyFiltersRow(
                      selectedFilter: state.selectedFilter,
                      filtersToggle: FilterToggle.values,
                      onToggleChanged: (filter) {
                        final cubit = BlocProvider.of<MarketplaceCubit>(
                          context,
                        );
                        cubit.getListings(filter: filter);
                      },
                    ).onlyPadding(
                      leftPadding: kPaddingDefaultHorizontal,
                      rightPadding: kPaddingDefaultHorizontal,
                      bottomPadding: kPaddingVertical,
                    ),
                    const AdaptiveDivider(),
                    ResultsCountAndSortButton(
                      propertyLength: listings.length.toString(),
                    ).onlyPadding(
                      leftPadding: kPaddingDefaultHorizontal,
                      rightPadding: kPaddingDefaultHorizontal,
                      topPadding: kPaddingDefaultVertical,
                    ),
                    Expanded(child: ListingsList(listings: listings)),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
