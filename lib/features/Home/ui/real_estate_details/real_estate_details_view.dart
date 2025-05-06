import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/url_launcher.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/about_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/description_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/listed_by_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/purpose_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/real_estate_details_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Search/ui/widgets/amenities_widget.dart';
import 'package:system_pro/gen/assets.gen.dart';

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
                    subcategory: listing.subcategory?.name ?? '',
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
                SliverToBoxAdapter(
                  child: AmenitiesWidget(amenities: listing.amenities ?? []),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: ListedByWidget(company: listing.company ?? Company()),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: LocationRealEstate(location: listing.location ?? ''),
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
          CustomConnectionButton(
            whatsAppURL: listing.company?.phone ?? '',
            phoneURL: listing.company?.phone ?? '',
          ).hPadding(kPaddingDefaultHorizontal),
        ],
      ).onlyPadding(bottomPadding: kPaddingVertical),
    );
  }
}

class LocationRealEstate extends StatelessWidget {
  const LocationRealEstate({super.key, required this.location});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.location,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        verticalSpacing(kSpacingSmall),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: ColorManager.pureBlack,
              size: kIconSizeDefault.sp,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Assets.images.map.path, height: 200.h, width: 320.w),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  urlLauncher(
                    context,
                    'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}',
                  );
                },
                child: Container(
                  width: context.width * 0.4,
                  height: kButtonHeightPrimary.h,
                  alignment: Alignment.center,

                  decoration: const BoxDecoration(
                    color: ColorManager.pureWhite,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: ColorManager.softGray,
                        size: kIconSizeDefault.sp,
                      ),
                      Text(
                        context.localization.see_location,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeightHelper.medium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
