import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/CompanyProfile/ui/company_profile_view.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/about_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/description_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/listed_by_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/purpose_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/real_estate_details_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Search/ui/widgets/amenities_widget.dart';

class RealEstateDetailsView extends StatelessWidget {
  const RealEstateDetailsView({super.key, required this.listing});
  final Listing listing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const RealEstateDetailsImage(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AboutRealEstate(
                    price: listing.price ?? '',
                    location: listing.location ?? '',
                    title: listing.title ?? '',
                    bedrooms: listing.rooms.toString(),
                    bathrooms: listing.bathrooms.toString(),
                    area: listing.area.toString(),
                    date: listing.createdAt ?? '',
                    downPayment: listing.downPayment.toString(),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: DescriptionWidget(
                    description: listing.description ?? '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                //TODO: لسه مش موجوده
                const SliverToBoxAdapter(child: PurposeWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                //TODO: لسه مش موجوده
                const SliverToBoxAdapter(child: AmenitiesWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: ListedByWidget(company: listing.company ?? Company()),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: LocationWidget(location: listing.location ?? ''),
                ),
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
