import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/ui/fav_widgets/favorites_view_body.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    // Call fetch favorite listings once screen is initialized
    context.read<MarketplaceCubit>().getFavoriteListings();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.localization.favorites,
            textAlign: TextAlign.center,
            style: context.headlineMedium?.copyWith(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.primaryBlue,
                darkColor: ColorManager.pureWhite,
              ),
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
                AppLogs.debugLog('Favorite listings: ${listings.length}');
                if (listings.isEmpty) {
                  return CustomErrorWidget(
                    errorMessage: context.localization.no_favorite_properties,
                  );
                }
                return FavoritesViewBody(listings: listings);
              } else if (state is GetFavoriteError) {
                return CustomErrorWidget(errorMessage: state.error);
              }

              return CustomErrorWidget(
                errorMessage: context.localization.no_favorite_properties,
              );
            },
          ),
        ),
      ],
    ).vPadding(kPaddingDefaultVertical);
  }
}
