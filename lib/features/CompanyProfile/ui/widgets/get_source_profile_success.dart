import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_back_button.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/data/model/realestate_source.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/about_real_estate_widget.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/location_widget.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

/// Widget to display a source profile (either company or marketer)
class GetSourceProfileSuccess extends StatelessWidget {
  const GetSourceProfileSuccess({
    super.key,
    required this.realEstateSource,
    required this.realEstateSourceListings,
    required this.isCompanyProfile,
    required this.scrollController,
    this.isLoadingMore = false,
  });

  final RealEstateSource realEstateSource;
  final List<Listing> realEstateSourceListings;
  final bool isCompanyProfile;
  final ScrollController scrollController;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🟦 Profile Header Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBackButton(context: context),
            Expanded(
              child: Column(
                children: [
                  verticalSpacing(kSpacingLarge),
                  // Profile Picture Circle
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: ColorManager.pureBlack,
                      borderRadius: BorderRadius.circular(320),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(320),
                      child: CustomCachedNetworkImageWidget(
                        imageURL: realEstateSource.pictureUrl ?? '',
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  verticalSpacing(kSpacingDefault),
                  // Name Text
                  Text(
                    realEstateSource.name ?? '',
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  verticalSpacing(kSpacingSmall),
                  // Property count Text
                  Text(
                    '${realEstateSourceListings.length} ${context.localization.properties}',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.softGrey,
                        darkColor: ColorManager.hintGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        verticalSpacing(kSpacingXLarge),
        // 📍 Location Info
        LocationWidget(location: realEstateSource.address ?? ''),

        verticalSpacing(kSpacingDefault),

        // 📄 About/Bio
        AboutRealEstateWidget(description: realEstateSource.bio ?? ''),
        verticalSpacing(kSpacingLarge),

        // ─ Divider
        const AdaptiveDivider(),
        verticalSpacing(kSpacingDefault),

        // 🏠 Properties Count
        Text(
          context.localization.properties,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        const AdaptiveDivider(), verticalSpacing(kSpacingDefault),

        // 🟦 Scrollable Profile Details Section
        Expanded(
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // 🏘 Real Estate Listings
              RealEstateSliverList(listings: realEstateSourceListings),

              // 🔄 Loader if loading more items
              if (isLoadingMore)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: kPaddingDefaultHorizontal.w,
                        vertical: kPaddingDefaultVertical.h,
                      ),
                      child: const CustomLoader(type: LoaderType.adaptive),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
