import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/about_real_estate_widget.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/location_widget.dart';
import 'package:system_pro/features/CompanyProfile/ui/widgets/properties_widget.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class GetProfileCompanySuccess extends StatelessWidget {
  const GetProfileCompanySuccess({
    super.key,
    required this.company,
    required this.companyListings,
  });

  final Company company;
  final List<Listing> companyListings;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RealEstateCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customAppBarBack(context),
            Expanded(
              child: Column(
                children: [
                  verticalSpacing(kSpacingLarge),
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
                        imageURL: company.pictureUrl ?? '',
                        height: 32.h,
                        width: 100.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  verticalSpacing(kSpacingDefault),
                  Text(
                    company.name ?? '',
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  verticalSpacing(kSpacingSmall),
                  Text(
                    '${companyListings.length} ${context.localization.properties}',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.softGray,
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
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent - 50 &&
                  !cubit.isLoading &&
                  cubit.hasMore) {
                cubit.loadMoreListingsByCompany();
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: LocationWidget(location: company.address ?? ''),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                SliverToBoxAdapter(
                  child: AboutRealEstateWidget(description: company.bio ?? ''),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingLarge)),
                const SliverToBoxAdapter(child: CustomDivider()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                SliverToBoxAdapter(
                  child: PropertiesWidget(
                    propertyLength: companyListings.length.toString(),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                RealEstateSliverList(listings: companyListings),

                // ✅ تحميل إضافي عند الوصول للنهاية
                if (cubit.isLoading)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: kPaddingDefaultHorizontal.w,
                          vertical: kPaddingDefaultVertical.h,
                        ),
                        child: const AdaptiveIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
