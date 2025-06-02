import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_item.dart';

/// A sliver-based list or grid that displays a scrollable list of real estate listings.
/// Supports item click navigation, favorite toggling, and display mode switching.
class RealEstateSliverList extends StatelessWidget {
  const RealEstateSliverList({
    super.key,
    required this.listings,
    this.onToggleFavoriteBuilder,
    this.isGrid = false,
  });

  /// List of listings to render.
  final List<Listing> listings;

  /// Optional callback builder for favorite toggle button.
  final VoidCallback Function(Listing listing)? onToggleFavoriteBuilder;

  /// If true, display listings in a Grid. Otherwise, use List view.
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      // ✅ SliverGrid Mode
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            final listing = listings[index];
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.realEstateDetailsView,
                  arguments: listing,
                );
              },
              child: RealEstateItem(
                key: ValueKey(listing.id),
                listing: listing,
                index: index,
                onToggleFavorite:
                    onToggleFavoriteBuilder != null
                        ? (updatedListing) =>
                            onToggleFavoriteBuilder!(listing).call()
                        : null,
                useGridLayout: true, // ⬅️ Add this to adjust internal layout
              ),
            );
          }, childCount: listings.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
        ),
      );
    }

    // ✅ SliverList Mode
    return SliverList.separated(
      itemBuilder: (context, index) {
        final listing = listings[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.realEstateDetailsView, arguments: listing);
          },
          child: RealEstateItem(
            key: ValueKey(listing.id),
            listing: listing,
            index: index,
            onToggleFavorite:
                onToggleFavoriteBuilder != null
                    ? (updatedListing) =>
                        onToggleFavoriteBuilder!(listing).call()
                    : null,
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpacing(kSpacingDefault),
      itemCount: listings.length,
    );
  }
}
