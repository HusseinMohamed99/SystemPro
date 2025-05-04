import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/CompanyProfile/ui/company_profile_view.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/about_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/description_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/listed_by_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/purpose_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/real_estate_details_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Search/ui/widgets/amenities_widget.dart';

class RealEstateDetailsView extends StatelessWidget {
  const RealEstateDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const RealEstateDetailsImage(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: AboutRealEstate()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                const SliverToBoxAdapter(child: DescriptionWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                const SliverToBoxAdapter(child: PurposeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                const SliverToBoxAdapter(child: AmenitiesWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                const SliverToBoxAdapter(child: ListedByWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                const SliverToBoxAdapter(child: LocationWidget(location: 'Khartoum')),
              ],
            ).allPadding(
              hPadding: kPaddingDefaultHorizontal,
              vPadding: kPaddingDefaultVertical,
            ),
          ),
          Divider(
            color: ColorManager.borderGrey,
            height: 1.h,
          ).vPadding(kSpacingSmall),
          const CustomConnectionButton().hPadding(kPaddingDefaultHorizontal),
        ],
      ),
    );
  }
}
