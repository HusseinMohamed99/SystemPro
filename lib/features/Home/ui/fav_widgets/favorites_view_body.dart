import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceCubit, MarketplaceState>(
      builder: (context, state) {
        if (state is GetFavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFavoriteSuccess) {
          final listings = state.listings;

          if (listings.isEmpty) {
            return const Center(child: Text("لا يوجد عقارات مفضلة"));
          }

          return CustomScrollView(
            slivers: [RealEstateSliverList(listings: listings)],
          ).hPadding(kPaddingDefaultHorizontal);
        } else if (state is GetFavoriteError) {
          return Center(child: Text(''));
        }

        return const SizedBox.shrink(); // في حالة initial أو غير متوقعة
      },
    );
  }
}
