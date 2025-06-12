// ✅ recent_searches_cubit.dart
// ✅ recent_searches_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/data/model/location_model.dart';
import 'package:system_pro/features/Search/logic/recent_searches_cubit.dart';
import 'package:system_pro/features/Search/logic/recent_searches_state.dart';

class RecentSearchesScreen extends StatefulWidget {
  const RecentSearchesScreen({super.key});

  @override
  State<RecentSearchesScreen> createState() => _RecentSearchesScreenState();
}

class _RecentSearchesScreenState extends State<RecentSearchesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RecentSearchesCubit>().initialize();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ✅ Build a reusable tile for search result or recent item
  Widget _buildSearchTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.softGrey,
          darkColor: ColorManager.iconGrey,
        ),
      ),
      title: Text(
        title,
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
      ),
      subtitle:
          subtitle != null ? Text(subtitle, style: context.titleSmall) : null,
      onTap: onTap,
      onLongPress:
          subtitle != null
              ? () {
                Clipboard.setData(ClipboardData(text: '$title, $subtitle'));
                context.showSnackBar(
                  context.isAr ? 'تم النسخ' : 'Copied to clipboard',
                );
              }
              : null,
    );
  }

  // ✅ Header with close button and search field
  Widget _buildSearchHeader() => Row(
    children: [
      GestureDetector(
        onTap: context.pop,
        child: Icon(
          Icons.close,
          color: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.softGrey,
            darkColor: ColorManager.iconGrey,
          ),
        ),
      ),
      horizontalSpacing(kSpacingSmall),
      Expanded(
        child: CustomSearchTextField(
          readOnly: false,
          controller: _searchController,
          onChanged: (query) {
            final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(query);
            context.read<RecentSearchesCubit>().onSearchQueryChanged(
              query,
              isArabic: isArabic,
            );
          },
        ),
      ),
    ],
  );
  // ✅ Shows either filtered search results or recent searches list
  Widget _buildLocationsList(RecentSearchesState state) {
    final query = _searchController.text.trim();
    final isSearching = query.isNotEmpty;
    final isArabic = context.isAr;
    final locations = isSearching ? state.searchResults : state.recentSearches;

    if (state.isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if (locations.isEmpty && !isSearching) {
      return const SizedBox.shrink();
    }

    final itemCount = locations.length + (isSearching ? 0 : 1);

    return Expanded(
      child: ListView.builder(
        key: const PageStorageKey<String>('recentSearches'),
        itemCount: itemCount == 0 ? 1 : itemCount,
        itemBuilder: (context, index) {
          if (locations.isEmpty && isSearching) {
            return _buildSearchTile(
              icon: Icons.add_location_alt_outlined,
              title:
                  isArabic
                      ? 'إضافة "$query" كموقع مخصص'
                      : 'Add "$query" as custom location',
              onTap: () {
                final custom = LocationModel(
                  districtAr: query,
                  districtEn: query,
                  cityAr: isArabic ? 'موقع مخصص' : 'Custom location',
                  cityEn: 'Custom location',
                );
                context.read<RecentSearchesCubit>().selectLocation(custom);
                _searchController.text =
                    isArabic
                        ? '${custom.districtAr}، ${custom.cityAr}'
                        : '${custom.districtEn}, ${custom.cityEn}';
              },
            );
          }

          if (!isSearching && index == locations.length) {
            return _buildSearchTile(
              icon: Icons.delete_outline,
              title: isArabic ? 'مسح عمليات البحث' : 'Clear recent searches',
              onTap: () {
                context.read<RecentSearchesCubit>().clearRecentSearches();
                context.showSnackBar(
                  isArabic ? 'تم مسح سجل البحث' : 'Recent searches cleared',
                );
              },
            );
          }

          final location = locations[index];
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
            builder:
                (_, offset, child) =>
                    Transform.translate(offset: offset, child: child!),
            child: _buildSearchTile(
              icon: isSearching ? Icons.place : Icons.history,
              title: isArabic ? location.districtAr : location.districtEn,
              subtitle: isArabic ? location.cityAr : location.cityEn,
              onTap: () {
              context.read<RecentSearchesCubit>().selectLocation(location);
                _searchController.text =
                    isArabic
                        ? '${location.districtAr}، ${location.cityAr}'
                        : '${location.districtEn}, ${location.cityEn}';
              },
            ),
          );
        },
      ),
    );
  }

  // ✅ Main build method with done button at the bottom
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentSearchesCubit, RecentSearchesState>(
      builder: (context, state) {
        final isSearching = _searchController.text.isNotEmpty;
        final isArabic = context.isAr;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchHeader(),
                  verticalSpacing(kSpacingXLarge),
                  Text(
                    isSearching
                        ? context.localization.result
                        : context.localization.recent_search,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  verticalSpacing(kSpacingSmall),
                  _buildLocationsList(state),
                ],
              ),
            ),
            CustomButton(
              text: context.localization.done,
              onPressed: () {
                final selected = state.selectedLocation;
                if (selected != null) {
                  context.pushNamed(
                    Routes.filterView,
                    arguments: LocationArgument(
                      district:
                          isArabic ? selected.districtAr : selected.districtEn,
                      city: isArabic ? selected.cityAr : selected.cityEn,
                    ),
                  );
                } else {
                  context.showSnackBar(context.localization.select_location);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
