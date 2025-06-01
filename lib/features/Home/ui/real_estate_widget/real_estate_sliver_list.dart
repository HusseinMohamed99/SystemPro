import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_item.dart';

class RealEstateSliverList extends StatelessWidget {
  const RealEstateSliverList({
    super.key,
    required this.listings,
    this.onToggleFavoriteBuilder,
  });

  final List<Listing> listings;

  /// 🆕 Callback function to return the correct toggle handler per listing
  final VoidCallback Function(Listing listing)? onToggleFavoriteBuilder;

  @override
  Widget build(BuildContext context) {
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
            onToggleFavorite: onToggleFavoriteBuilder?.call(listing), // 🆕
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpacing(kSpacingDefault),
      itemCount: listings.length,
    );
  }
}
