import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

class FilterResultWidget extends StatefulWidget {
  const FilterResultWidget({super.key, required this.arguments});
  final FilterResultArguments arguments;

  @override
  FilterResultWidgetState createState() => FilterResultWidgetState();
}

class FilterResultWidgetState extends State<FilterResultWidget> {
  bool _isFirstBuild = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstBuild) {
      _isFirstBuild = false;
      context.read<MarketplaceCubit>().fetchAndFilterListings(widget.arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavoriteCubit>(),
      child: Scaffold(
        appBar: customSecondaryAppBar(
          context,
          title: context.localization.results_search,
          textColor: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.primaryBlue,
            darkColor: ColorManager.pureWhite,
          ),
        ),
        body: BlocBuilder<MarketplaceCubit, MarketplaceState>(
          builder: (context, state) {
          final cubit = context.watch<MarketplaceCubit>();

            if (state is MarketPlaceLoading) {
              return const CustomLoader();
            }

            if (state is MarketPlaceError) {
              return CustomErrorTextWidget(errorMessage: state.error);
            }

            if (state is MarketPlaceSuccess) {
              final listings = state.listings;
              if (listings.isEmpty) {
                return CustomErrorTextWidget(
                  errorMessage: context.localization.no_available_properties,
                );
              }

              return Column(
                children: [
                  const AdaptiveDivider(),
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
                  Expanded(
                    child: ListingsListFilter(
                      listings: listings,
                      arguments: widget.arguments,
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class ListingsListFilter extends StatelessWidget {
  const ListingsListFilter({
    super.key,
    required this.listings,
    required this.arguments,
  });
  final List<Listing> listings;
  final FilterResultArguments arguments;

  @override
  Widget build(BuildContext context) {
    final marketplaceCubit = context.read<MarketplaceCubit>();
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 200) {
          marketplaceCubit.loadMoreWithArgs(arguments);
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
    );
  }
}
