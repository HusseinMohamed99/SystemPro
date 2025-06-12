import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
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
class GetSourceProfileSuccess extends StatefulWidget {
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
  State<GetSourceProfileSuccess> createState() =>
      _GetSourceProfileSuccessState();
}

class _GetSourceProfileSuccessState extends State<GetSourceProfileSuccess> {
  bool hasScrolled = false;
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;

    // يظهر إذا بدأ scroll - يختفي إذا عاد للأعلى
    if (offset <= 0 && hasScrolled) {
      setState(() => hasScrolled = false);
    } else if (offset > 0 && !hasScrolled) {
      setState(() => hasScrolled = true);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🟦 Header Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBackButton(context: context),
            Expanded(
              child: Column(
                children: [
                  verticalSpacing(kSpacingMedium),
                  // 👤 Profile Picture
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: ColorManager.pureBlack,
                      borderRadius: BorderRadius.circular(320),
                      border: Border.all(
                        color: ColorManager.primaryBlue,
                        width: 1.5.w,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(320),
                      child: CustomCachedNetworkImageWidget(
                        imageURL: widget.realEstateSource.pictureUrl ?? '',
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpacing(kSpacingDefault),
                  Text(
                    widget.realEstateSource.name ?? '',
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  verticalSpacing(kSpacingSmall),
                  Text(
                    '${widget.realEstateSourceListings.length} ${context.localization.properties}',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color: customSoftAndHintGreyColor(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // 🔻 Divider يظهر فقط بعد أول Scroll
        if (hasScrolled)
          const AdaptiveDivider().vPadding(kPaddingDefaultVertical),

        // 🟦 Details Section
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (!hasScrolled && notification.metrics.pixels > 0) {
                setState(() => hasScrolled = true);
              }
              return false;
            },
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: [
                SliverToBoxAdapter(child: verticalSpacing(kSpacingXLarge)),
                SliverToBoxAdapter(
                  child: LocationWidget(
                    location: widget.realEstateSource.address ?? '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                SliverToBoxAdapter(
                  child: AboutRealEstateWidget(
                    description: widget.realEstateSource.bio ?? '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingLarge)),
                const SliverToBoxAdapter(child: AdaptiveDivider()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                SliverToBoxAdapter(
                  child: Text(
                    context.localization.properties,
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                RealEstateSliverList(listings: widget.realEstateSourceListings),
                if (widget.isLoadingMore)
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
        ),
      ],
    );
  }
}
