import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
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
            style: context.headlineMedium?.copyWith(
              color: ColorManager.primaryBlue,
            ),
          ),
        ),
        verticalSpacing(kSpacingLarge),
        const CustomDivider(),
        verticalSpacing(kSpacingXLarge),
        Expanded(
          child: BlocBuilder<MarketplaceCubit, MarketplaceState>(
            builder: (context, state) {
              if (state is GetFavoriteLoading) {
                return const AdaptiveIndicator();
              } else if (state is GetFavoriteSuccess) {
                final listings = state.listings;
                if (listings.isEmpty) {
                  return CustomErrorWidget(
                    errorMessage: context.localization.no_favorite_properties,
                  );
                }
                return FavoritesViewBody(listings: listings);
              } else if (state is GetFavoriteError) {
                return CustomErrorWidget(errorMessage: state.error);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    ).vPadding(kPaddingDefaultVertical.h);
  }
}
