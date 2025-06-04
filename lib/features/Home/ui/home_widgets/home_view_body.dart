import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/listings_list_widget.dart';
import 'package:system_pro/features/Home/ui/home_widgets/property_filters_row.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Search TextField with padding
        const CustomSearchTextField().onlyPadding(
          leftPadding: kPaddingDefaultHorizontal,
          rightPadding: kPaddingDefaultHorizontal,
          bottomPadding: kPaddingVertical,
          topPadding: kPaddingDefaultVertical,
        ),
        // Main content area
        Expanded(
          child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
            builder: (context, state) {
        
              // Loading state
              if (state is MarketPlaceLoading) {
                return const CustomLoader(type: LoaderType.adaptive);
              }

              // Error state
              if (state is MarketPlaceError) {
                return CustomErrorTextWidget(
                  errorMessage: state.error,
                  onRetry: () => context.read<MarketplaceCubit>().getListings(),
                );
              }

              // Success state with data
              if (state is MarketPlaceSuccess) {
                final listings = state.listings;
                final cubit = context.read<MarketplaceCubit>();
                cubit.initSortOptionsIfNeeded(context);

                return Column(
                  children: [
                    // Toggle filter buttons (e.g., buy/rent)
                    PropertyFiltersRow(
                      selectedFilter: state.selectedFilter,
                      filtersToggle: FilterToggle.values,
                      onToggleChanged: (filter) {
                        final cubit = context.read<MarketplaceCubit>();
                        cubit.getListings(filter: filter);
                      },
                    ).onlyPadding(
                      leftPadding: kPaddingDefaultHorizontal,
                      rightPadding: kPaddingDefaultHorizontal,
                      bottomPadding: kPaddingVertical,
                    ),
                    const AdaptiveDivider(),
                    // Display count and sort option
                    ResultsCountAndSortButton(
                      propertiesCount: listings.length.toString(),
                      selectedSort: cubit.selectedSort,
                      sortOptions: cubit.sortOptions,
                      onSortSelected: cubit.sortListings,

                    ).onlyPadding(
                      leftPadding: kPaddingDefaultHorizontal,
                      rightPadding: kPaddingDefaultHorizontal,
                      topPadding: kPaddingDefaultVertical,
                    ),

                    // Main listings view
                    Expanded(child: ListingsList(listings: listings)),
                  ],
                );
              }

              // Initial or unknown state
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
