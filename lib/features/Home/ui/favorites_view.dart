import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_state.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FavoriteCubit>().getFavoriteListings(
      forceRefresh: true,
      context: context,
    );
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
              color: customPrimaryBlueAndWhiteColor(context),
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
                return const CustomLoader(type: LoaderType.adaptive);
              } else if (state is GetFavoriteSuccess) {
                final listings = state.listings;
                if (listings.isEmpty) {
                  return CustomErrorTextWidget(
                    errorMessage: context.localization.no_favorite_properties,
                  );
                }
                return RefreshIndicator(
                  onRefresh:
                      () => context.read<FavoriteCubit>().refreshFavorites(
                        context: context,
                      ),
                  child: FavoritesViewBody(
                    listings: listings,
                    scrollController: _scrollController,
                  ),
                );
              } else if (state is GetFavoriteError) {
                return CustomErrorTextWidget(errorMessage: state.error);
              }
              return CustomErrorTextWidget(
                errorMessage: context.localization.no_favorite_properties,
                onRetry:
                    () => context.read<FavoriteCubit>().refreshFavorites(
                      context: context,
                    ),
              );
            },
          ),
        ),
      ],
    ).vPadding(kPaddingDefaultVertical);
  }
}
