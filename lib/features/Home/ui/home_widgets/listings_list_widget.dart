import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

/// Widget that displays a list of real estate listings inside a scrollable sliver list.
/// Supports infinite scrolling and handles empty list state.
class ListingsList extends StatelessWidget {
  const ListingsList({super.key, required this.listings});

  final List<Listing> listings;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketplaceCubit>();

    // If the listings list is empty, display a friendly error message.
    if (listings.isEmpty) {
      return CustomErrorTextWidget(
        errorMessage: context.localization.no_available_properties,
      );
    }

    return NotificationListener<ScrollNotification>(
      // Listen for scroll notifications to trigger pagination when reaching the bottom.
      onNotification: (notification) {
        if (_shouldLoadMore(notification, cubit)) {
          cubit.loadMore();
        }
        return false;
      },
      child: CustomScrollView(
        slivers: [
          RealEstateSliverList(
            listings: listings,
            // Build the favorite toggle callback per listing item.
            onToggleFavoriteBuilder: (listing) {
              return () {
                cubit.toggleFavorite(listing.id ?? 0, listing: listing);
              };
            },
          ),
          SliverToBoxAdapter(child: verticalSpacing(20),),
          // Display a loading indicator when pagination is in progress.
          if (cubit.pagination.hasMore|| cubit.pagination.isLoading)
            const SliverToBoxAdapter(child: Center(child: CustomLoader())),
           if (cubit.pagination.hasMore || cubit.pagination.isLoading)
            SliverToBoxAdapter(child: verticalSpacing(40)),
        ],
      ),
    ).onlyPadding(
      leftPadding: kPaddingDefaultHorizontal,
      rightPadding: kPaddingDefaultHorizontal,
      topPadding: kPaddingDefaultVertical,
    );
  }

  /// Helper method to check whether the user has scrolled to the bottom of the list
  /// and whether more data should be fetched.
  bool _shouldLoadMore(
    ScrollNotification notification,
    MarketplaceCubit cubit,
  ) {
    final reachedBottom =
        notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 50;

    return notification is ScrollEndNotification &&
        reachedBottom &&
        !cubit.pagination.isLoading &&
        cubit.pagination.hasMore;
  }
}
