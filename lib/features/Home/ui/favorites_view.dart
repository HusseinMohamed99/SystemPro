import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/favorite_state.dart';
import 'package:system_pro/features/Home/ui/fav_widgets/favorites_view_body.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<FavoriteCubit>();
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          cubit.hasMore &&
          !cubit.isLoading) {
        cubit.loadMore();
      }
    });
  }

  // ✅ هذا هو التعديل الأهم
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FavoriteCubit>().getFavoriteListings(forceRefresh: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        const AdaptiveDivider(),
        verticalSpacing(kSpacingXLarge),
        Expanded(
          child: BlocConsumer<FavoriteCubit, FavoriteState>(
            listener: (context, state) {},
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

                return RefreshIndicator(
                  onRefresh:
                      () => context.read<FavoriteCubit>().refreshFavorites(),
                  child: FavoritesViewBody(
                    listings: listings,
                    scrollController: _scrollController,
                  ),
                );
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
