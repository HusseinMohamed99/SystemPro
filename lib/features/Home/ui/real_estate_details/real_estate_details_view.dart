import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/about_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/amenities_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/description_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/listed_by_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/location_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/purpose_real_estate.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/real_estate_details_image_slider.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';

class RealEstateDetailsView extends StatelessWidget {
  const RealEstateDetailsView({super.key, required this.listing});
  final Listing listing;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            RealEstateDetailsImage(images: listing.images ?? []),
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
                  SliverToBoxAdapter(
                    child: PurposeWidget(purpose: listing.listingType ?? ''),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                  SliverToBoxAdapter(
                    child: AmenitiesWidget(amenities: listing.amenities ?? []),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                  SliverToBoxAdapter(
                    child: ListedByWidget(
                      company: listing.company ?? Company(),
                    ),
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
            const CustomDivider().vPadding(kSpacingSmall),
            CustomConnectionButton(
              whatsAppURL: listing.company?.phone ?? '',
              phoneURL: listing.company?.phone ?? '',
            ).hPadding(kPaddingDefaultHorizontal),
          ],
        ).onlyPadding(bottomPadding: kPaddingVertical),
      ),
    );
  }
}
