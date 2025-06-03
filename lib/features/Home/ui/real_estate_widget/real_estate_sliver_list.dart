import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_item.dart';

/// A reusable sliver list for displaying real estate listings with custom interactions.
class RealEstateSliverList extends StatelessWidget {
  const RealEstateSliverList({
    super.key,
    required this.listings,
    this.heroTagBuilder,
    this.showImage = true,
  });

  /// List of real estate listings to display
  final List<Listing> listings;



  /// Optional builder for Hero tag support
  final String Function(Listing listing)? heroTagBuilder;

  /// Whether to show property image inside the list item
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    if (listings.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverList.separated(
      itemBuilder: (context, index) {
        final listing = listings[index];

        return GestureDetector(
          onTap: () {
              context.pushNamed(Routes.realEstateDetailsView, arguments: listing);
          },
          child: RealEstateItem(
            key: ValueKey('${listing.id}_${listing.isFavorite}'),
            listing: listing,
            index: index,
            // onToggleFavorite: onToggleFavoriteBuilder,
            heroTag: heroTagBuilder?.call(listing),
            showImage: showImage,
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpacing(kSpacingDefault),
      itemCount: listings.length,
    );
  }
}
