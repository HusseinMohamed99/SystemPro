import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

class FilterResultWidget extends StatefulWidget {
  const FilterResultWidget({super.key, required this.arguments});
  final FilterResultArguments arguments;

  @override
  _FilterResultWidgetState createState() => _FilterResultWidgetState();
}

class _FilterResultWidgetState extends State<FilterResultWidget> {
  bool _isFirstBuild = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstBuild) {
      _isFirstBuild = false;
      BlocProvider.of<MarketplaceCubit>(
        context,
      ).fetchAndFilterListings(widget.arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          if (state is MarketPlaceLoading) {
            return const AdaptiveIndicator();
          }

          if (state is MarketPlaceError) {
            return CustomErrorWidget(errorMessage: state.error);
          }

          if (state is MarketPlaceSuccess) {
            final listings = state.listings;
            if (listings.isEmpty) {
              return CustomErrorWidget(
                errorMessage: context.localization.no_available_properties,
              );
            }

            return Column(
              children: [
                const CustomDivider(),
                ResultsCountAndSortButton(
                  propertyLength: listings.length.toString(),
                ).onlyPadding(
                  leftPadding: kPaddingDefaultHorizontal,
                  rightPadding: kPaddingDefaultHorizontal,
                  topPadding: kPaddingDefaultVertical,
                ),
                Expanded(child: ListingsListFilter(listings: listings)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class ListingsListFilter extends StatelessWidget {
  const ListingsListFilter({super.key, required this.listings});
  final List<Listing> listings;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MarketplaceCubit>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 200) {
          cubit.loadMore();
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
