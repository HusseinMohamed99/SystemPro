import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

/// Widget that displays the list of real estate items with infinite scroll and debounce control.
class ListingsList extends StatefulWidget {
  const ListingsList({super.key, required this.listings});

  final List<Listing> listings;

  @override
  State<ListingsList> createState() => _ListingsListState();
}

class _ListingsListState extends State<ListingsList> {
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketplaceCubit>();

    // Show error widget if no listings are available
    if (widget.listings.isEmpty) {
      return CustomErrorTextWidget(
        errorMessage: context.localization.no_available_properties,
      );
    }

    return NotificationListener<ScrollNotification>(
      // Detect scroll to bottom with debounce to prevent rapid loadMore calls
      onNotification: (notification) {
        if (_shouldLoadMore(notification, cubit)) {
          _debounce(cubit.loadMore);
        }
        return false;
      },
      child: CustomScrollView(
        slivers: [
          // Listings content
          RealEstateSliverList(
            listings: widget.listings,
          ),

          // Spacing and loader
          SliverToBoxAdapter(child: verticalSpacing(20)),

          if (_showLoader(cubit))
            const SliverToBoxAdapter(child: Center(child: CustomLoader())),

          if (_showLoader(cubit))
            SliverToBoxAdapter(child: verticalSpacing(40)),
        ],
      ),
    ).onlyPadding(
      leftPadding: kPaddingDefaultHorizontal,
      rightPadding: kPaddingDefaultHorizontal,
      topPadding: kPaddingDefaultVertical,
    );
  }

  /// Waits 300ms before triggering callback to avoid multiple executions
  void _debounce(VoidCallback callback) {
    if (_debounceTimer?.isActive ?? false) return;
    _debounceTimer = Timer(const Duration(milliseconds: 300), callback);
  }

  /// Returns true if scroll reached bottom and can load more
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

  /// Whether to show the loader at the bottom
  bool _showLoader(MarketplaceCubit cubit) {
    return cubit.pagination.hasMore || cubit.pagination.isLoading;
  }
}
