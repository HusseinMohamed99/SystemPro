

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class ListingsList extends StatelessWidget {
  const ListingsList({super.key, required this.listings});
  final List<Listing> listings;
  @override
  Widget build(BuildContext context) {
    if (listings.isEmpty) {
      return CustomErrorTextWidget(
        errorMessage: context.localization.no_available_properties,
      );
    }
    final cubit = BlocProvider.of<MarketplaceCubit>(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 50 &&
            !cubit.isLoading &&
            cubit.hasMore) {
          cubit.loadMore();
        }
        return false;
      },
      child: CustomScrollView(
        slivers: [
          RealEstateSliverList(
            listings: listings,
          onToggleFavoriteBuilder: (listing) {
              return () {
                cubit.toggleFavorite(
                  listing.id ?? 0,
                  listing: listing,
                ); // ✅ مهم جدًا
              };
            },

          ),
        ],
      ),
    ).onlyPadding(
      leftPadding: kPaddingDefaultHorizontal,
      rightPadding: kPaddingDefaultHorizontal,
      topPadding: kPaddingDefaultVertical,
    );

  }
}
