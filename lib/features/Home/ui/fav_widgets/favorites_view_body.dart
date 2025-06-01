import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({
    super.key,
    required this.listings,
    required this.scrollController,
  });

  final List<Listing> listings;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        RealEstateSliverList(
          listings: listings,
          onToggleFavoriteBuilder: (listing) {
            return () {
              context.read<FavoriteCubit>().toggleFavorite(
                listing.id ?? 0,
                listing: listing,
              );
            };
          },
        ),
      ],
    ).hPadding(kPaddingDefaultHorizontal);
  }
}
