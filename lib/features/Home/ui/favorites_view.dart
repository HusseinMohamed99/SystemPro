import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/fav_widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.localization.favorites,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorManager.primaryBlue,
            ),
          ),
        ),
        verticalSpacing(kSpacingLarge),
        const Divider(color: ColorManager.borderGrey),
        verticalSpacing(kSpacingXLarge),
        Expanded(
          child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
            builder: (context, state) {
              if (state is MarketPlaceLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MarketPlaceSuccess) {
                final listings = state.listings;

                if (listings.isEmpty) {
                  return const Center(child: Text('لا يوجد عقارات مفضلة'));
                }
                return FavoritesViewBody(listings: listings);
              } else if (state is GetFavoriteError) {
                return CustomErrorWidget(errorMessage: state.error);
              }

              return const SizedBox.shrink(); // في حالة initial أو غير متوقعة
            },
          ),
        ),
      ],
    ).vPadding(kPaddingDefaultVertical.h);
  }
}
