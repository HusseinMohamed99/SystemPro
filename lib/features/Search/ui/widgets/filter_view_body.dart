import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Home/ui/home_widgets/property_filters_row.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/ui/widgets/amenities_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/bathrooms_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/bedrooms_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/buy_rent_toggle_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/price_range_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/property_size_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/property_type_widget.dart';
import 'package:system_pro/features/Search/ui/widgets/toggle_category_widget.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key, required this.locationArgument});
  final LocationArgument locationArgument;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ToggleCategoryWidget(),
        verticalSpacing(kSpacingXXLarge),
        const BuyRentToggleWidget(),
        verticalSpacing(kSpacingXXLarge),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: PropertyTypeWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              const SliverToBoxAdapter(child: PriceRangeWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              const SliverToBoxAdapter(child: BedroomsWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              const SliverToBoxAdapter(child: BathroomsWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              const SliverToBoxAdapter(child: PropertySizeWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              const SliverToBoxAdapter(child: AmenitiesWidget()),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingMedium)),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          color: ColorManager.borderGrey,
        ).onlyPadding(bottomPadding: kPaddingDefaultVertical),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: context.localization.clear_all,
                onPressed: () {},
                backgroundColor: ColorManager.shadowBlue,
                textStyleColor: ColorManager.primaryBlue,
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


