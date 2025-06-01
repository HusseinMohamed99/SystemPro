

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class ListingsList extends StatelessWidget {
  const ListingsList({super.key, required this.listings});

  final List<Listing> listings;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MarketplaceCubit>(context);

    // Show empty state widget if listings is empty
    if (listings.isEmpty) {
      return CustomErrorTextWidget(
        errorMessage: context.localization.no_available_properties,
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final reachedBottom =
            notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 50;

        if (notification is ScrollEndNotification &&
            reachedBottom &&
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
                cubit.toggleFavorite(listing.id ?? 0, listing: listing);
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
