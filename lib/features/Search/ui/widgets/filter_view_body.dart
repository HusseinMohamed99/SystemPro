import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/filters.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Search/data/model/category_response.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/logic/categories_cubit.dart';
import 'package:system_pro/features/Search/logic/categories_state.dart';
import 'package:system_pro/features/Search/ui/widgets/amenities_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/bathrooms_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/bedrooms_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/buy_rent_toggle_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/price_range_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/property_size_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/property_type_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/toggle_category_widget.dart';

class FilterViewBody extends StatefulWidget {
  const FilterViewBody({super.key, required this.locationArgument});
  final LocationArgument locationArgument;
  @override
  State<FilterViewBody> createState() => _FilterViewBodyState();
}

class _FilterViewBodyState extends State<FilterViewBody> {
  final bedroomsKey = GlobalKey<BedroomsWidgetState>();
  final bathroomsKey = GlobalKey<BathroomsWidgetState>();
  final amenitiesKey = GlobalKey<AmenitiesWidgetState>();
  final propertyKey = GlobalKey<PropertyTypeWidgetState>();
  int selectedCategoryId = 1;
  String selectedBuyRentOption = 'buy';
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  final minPriceFocusNode = FocusNode();
  final maxPriceFocusNode = FocusNode();
  final minSizeController = TextEditingController();
  final maxSizeController = TextEditingController();
  final minSizeFocusNode = FocusNode();
  final maxSizeFocusNode = FocusNode();
  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    minSizeController.dispose();
    maxSizeController.dispose();
    minPriceFocusNode.dispose();
    maxPriceFocusNode.dispose();
    minSizeFocusNode.dispose();
    maxSizeFocusNode.dispose();
    super.dispose();
  }

  void clearAll() {
    bedroomsKey.currentState?.clearSelection();
    bathroomsKey.currentState?.clearSelection();
    amenitiesKey.currentState?.clearSelection();
    propertyKey.currentState?.clearSelection();
    minPriceController.clear();
    maxPriceController.clear();
    minSizeController.clear();
    maxSizeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is Loading) return const CustomLoader();
        if (state is Error) {
          return CustomErrorTextWidget(errorMessage: state.error);
        }
        if (state is! Success) return const SizedBox.shrink();
        final categories = state.data.data?.categories ?? [];
        if (categories.isEmpty) {
          return  CustomErrorTextWidget(
            errorMessage: context.localization.no_data_found,
          );
        }
        return Column(
          children: [
            ToggleCategoryWidget(
              filters: FilterType.values,
              enabledSlugs:
                  categories
                      .map((item) => item.name)
                      .whereType<String>()
                      .toList(),
              onCategoryChanged: (slug) {
                final category = categories.firstWhere(
                  (cat) => cat.name == slug,
                );
                setState(() => selectedCategoryId = category.id ?? 1);
              },
            ),
            verticalSpacing(kSpacingXXLarge),
            BuyRentToggleWidget(
              filtersToggle: FilterToggle.values,
              onToggleChanged: (value) {
                setState(() => selectedBuyRentOption = value);
              },
            ),
            verticalSpacing(kSpacingXXLarge),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  ..._buildSectionForCategory(categories),
                  SliverToBoxAdapter(child: verticalSpacing(kSpacingMedium)),
                ],
              ),
            ),
            const AdaptiveDivider().onlyPadding(
              bottomPadding: kPaddingDefaultVertical,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: context.localization.clear_all,
                    onPressed: clearAll,
                    backgroundColor: customShadowBlueAndTertiaryBlackColor(
                      context,
                    ),
                    textStyleColor: customPrimaryBlueAndWhiteColor(context),
                  ),
                ),
                horizontalSpacing(kSpacingDefault),
                Expanded(
                  child: CustomButton(
                    text: context.localization.find,
                    onPressed: () {
                      final filterArgs = FilterResultArguments(
                        location:
                            '${widget.locationArgument.district}, ${widget.locationArgument.city}',
                        category: selectedCategoryId,
                        listingType: selectedBuyRentOption,
                        selectedSubcategories:
                            propertyKey.currentState?.selectedTypeId,
                        bedrooms: bedroomsKey.currentState?.selectedBedrooms,
                        bathrooms: bathroomsKey.currentState?.selectedBathrooms,
                        minPrice: double.tryParse(minPriceController.text),
                        maxPrice: double.tryParse(maxPriceController.text),
                        minSize: double.tryParse(minSizeController.text),
                        maxSize: double.tryParse(maxSizeController.text),
                        selectedAmenities:
                            amenitiesKey.currentState?.selectedAmenityIds ?? [],
                      );
                      context.pushNamed(
                        Routes.filterResultWidget,
                        arguments: filterArgs,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildSectionForCategory(List<Category> categories) {
    if (categories.isEmpty) return [];

    final Category current = categories.firstWhere(
      (cat) => cat.id == selectedCategoryId,
      orElse: () => categories.first,
    );

    // استخراج الـ FilterType من الاسم الإنجليزي
    final filterType = getFilterTypeFromName(current.name ?? '');

    final widgets = <Widget>[
      SliverToBoxAdapter(
        child: PropertyTypeWidget(
          key: propertyKey,
          titleType:
              filterType == FilterType.land
                  ? context.localization.lands_type
                  : null,
          subcategories: current.subcategories ?? [],
        ),
      ),
      SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
      SliverToBoxAdapter(
        child: PriceRangeWidget(
          minPriceController: minPriceController,
          maxPriceController: maxPriceController,
          minPriceFocusNode: minPriceFocusNode,
          maxPriceFocusNode: maxPriceFocusNode,
        ),
      ),
      SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),

      // فقط لو النوع Residential أو Commercial
      if (filterType == FilterType.residential ||
          filterType == FilterType.commercial) ...[
        SliverToBoxAdapter(child: BedroomsWidget(key: bedroomsKey)),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
        SliverToBoxAdapter(child: BathroomsWidget(key: bathroomsKey)),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
      ],

      SliverToBoxAdapter(
        child: PropertySizeWidget(
          minSizeController: minSizeController,
          maxSizeController: maxSizeController,
          minSizeFocusNode: minSizeFocusNode,
          maxSizeFocusNode: maxSizeFocusNode,
        ),
      ),
      SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),

      if (current.amenities != null && current.amenities!.isNotEmpty)
        SliverToBoxAdapter(
          child: AmenitiesWidget(
            key: amenitiesKey,
            amenities: current.amenities!,
          ),
        ),
    ];

    return widgets;
  }
}
