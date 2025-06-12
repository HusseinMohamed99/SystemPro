import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
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

// Widget لعرض نتائج الفلترة لعقارات حسب معايير معينة
class FilterResultWidget extends StatefulWidget {
  const FilterResultWidget({super.key, required this.arguments});
  final FilterResultArguments arguments;

  @override
  FilterResultWidgetState createState() => FilterResultWidgetState();
}

class FilterResultWidgetState extends State<FilterResultWidget> {
  bool _isFirstBuild = true;

  // استدعاء الفلترة عند أول build فقط باستخدام didChangeDependencies (لأن context جاهز هنا)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstBuild) {
      _isFirstBuild = false;
      context.read<MarketplaceCubit>().fetchAndFilterListings(
        widget.arguments,
        lang: context.localeCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavoriteCubit>(), // يتم مشاركة FavoriteCubit مع الواجهة
      child: Scaffold(
        appBar: customSecondaryAppBar(
          context,
          title: context.localization.results_search,
          textColor: customPrimaryBlueAndWhiteColor(context),
        ),
        body: BlocBuilder<MarketplaceCubit, MarketplaceState>(
          builder: (context, state) {
            final cubit = context.read<MarketplaceCubit>();

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

                  // زر العدّاد والترتيب
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

                  // عرض قائمة العقارات
                  Expanded(
                    child: ListingsListFilter(
                      listings: listings,
                      arguments: widget.arguments,
                    ),
                  ),
                ],
              );
            }

            return CustomErrorTextWidget(
              errorMessage: context.localization.unknown_error,
            ).center();
          },
        ),
      ),
    );
  }
}

// Widget مستقل يعرض قائمة العقارات باستخدام SliverList مع دعم التمرير اللانهائي
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
          // تحميل المزيد عند الاقتراب من النهاية
          marketplaceCubit.loadMoreWithArgs(
            arguments,
            lang: context.localeCode,
          );
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
