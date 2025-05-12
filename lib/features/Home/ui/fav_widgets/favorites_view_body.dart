import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key, required this.listings});
  final List<Listing> listings;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [RealEstateSliverList(listings: listings)],
    ).hPadding(kPaddingDefaultHorizontal);
  }
}
