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
    this.isGrid = false,
  });

  final List<Listing> listings;

  /// ✅ تم تعديل النوع من VoidCallback Function(...) إلى void Function(...)
  final void Function(Listing listing)? onToggleFavoriteBuilder;

  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
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
                // ✅ نمرر الـ callback مباشرة مع البيانات
                onToggleFavorite:
                    onToggleFavoriteBuilder != null
                        ? (updated) => onToggleFavoriteBuilder!(updated)
                        : null,
                useGridLayout: true,
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
                    ? (updated) => onToggleFavoriteBuilder!(updated)
                    : null,
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpacing(kSpacingDefault),
      itemCount: listings.length,
    );
  }
}
