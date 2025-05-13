import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
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

  void clearAll() {
    bedroomsKey.currentState?.clearSelection();
    bathroomsKey.currentState?.clearSelection();
    amenitiesKey.currentState?.clearSelection();
    propertyKey.currentState?.clearSelection();
  }

  late String selectedCategory;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedCategory = context.localization.residentail;
  }

  List<String> get propertyTypes {
    if (selectedCategory == 'residential') {
      return [
        'Apartment',
        'Villa',
        'Townhouse',
        'Penthouse',
        'Duplex',
        'Compound',
        'Studio',
        'Loft',
      ];
    } else {
      return [
        'Offices',
        'Clinic',
        'Commercial Building',
        'Factory',
        'Restaurant & Cafe',
        'Retail',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleCategoryWidget(
          onCategoryChanged: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
        ),
        verticalSpacing(kSpacingXXLarge),
        const BuyRentToggleWidget(),
        verticalSpacing(kSpacingXXLarge),
        Expanded(
          child: CustomScrollView(
            slivers: [
              if (selectedCategory == context.localization.residentail) ...[
                SliverToBoxAdapter(
                  child: PropertyTypeWidget(
                    key: propertyKey,
                    propertyTypes: propertyTypes,
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PriceRangeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                SliverToBoxAdapter(child: BedroomsWidget(key: bedroomsKey)),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                SliverToBoxAdapter(child: BathroomsWidget(key: bathroomsKey)),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PropertySizeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                SliverToBoxAdapter(
                  child: AmenitiesWidget(
                    key: amenitiesKey,
                    amenities: const [],
                  ),
                ),
              ],
              if (selectedCategory == context.localization.commercial
                  ) ...[
                SliverToBoxAdapter(
                  child: PropertyTypeWidget(
                    key: propertyKey,
                    propertyTypes: propertyTypes,
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PriceRangeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PropertySizeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                SliverToBoxAdapter(
                  child: AmenitiesWidget(
                    key: amenitiesKey,
                    amenities: const [],
                  ),
                ),
              ],
              
              if (selectedCategory == context.localization.lands)...[
                        SliverToBoxAdapter(
                  child: PropertyTypeWidget(
                    key: propertyKey,
                    propertyTypes: propertyTypes,
                    titleType: context.localization.lands_type,
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PriceRangeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
                const SliverToBoxAdapter(child: PropertySizeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              ],
              
              
              SliverToBoxAdapter(child: verticalSpacing(kSpacingMedium)),
            ],
          ),
        ),

        const CustomDivider().onlyPadding(
          bottomPadding: kPaddingDefaultVertical,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: context.localization.clear_all,
                onPressed: clearAll,
                backgroundColor: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.shadowBlue,
                  darkColor: ColorManager.tertiaryBlack,
                ),
                textStyleColor: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.primaryBlue,
                  darkColor: ColorManager.pureWhite,
                ),
              ),
            ),
            horizontalSpacing(kSpacingDefault),
            Expanded(
              child: CustomButton(
                text: context.localization.find,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
