import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/ui/home_widgets/result_count_and_sort_button.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({super.key, required this.arguments});
  final Company arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBarBack(context),
          Center(
            child: Column(
              children: [
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
                      imageURL: arguments.picture,
                      height: 32.h,
                      width: 100.w,

                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                verticalSpacing(kSpacingDefault),
                Text(
                  arguments.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                verticalSpacing(kSpacingSmall),
                Text(
                  '26 ${context.localization.properties}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                    color: ColorManager.softGray,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(kSpacingXLarge),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: LocationWidget(location: arguments.address ?? ''),
                ),

                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                SliverToBoxAdapter(
                  child: AboutRealEstateWidget(
                    description: arguments.bio ?? '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingLarge)),
                SliverToBoxAdapter(
                  child: Divider(
                    color: ColorManager.borderGrey,
                    thickness: 1,
                    height: 1.h,
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),

                //TODO: NEW END POINT
                const SliverToBoxAdapter(child: PropertiesWidget()),
                SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
                const RealEstateSliverList(listings: []),
              ],
            ),
          ),
        ],
      ).hPadding(kPaddingDefaultHorizontal),
    );
  }
}

class PropertiesWidget extends StatelessWidget {
  const PropertiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.properties,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        verticalSpacing(kSpacingLarge),
        const ResultsCountAndSortButton(),
      ],
    );
  }
}

class AboutRealEstateWidget extends StatelessWidget {
  const AboutRealEstateWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.about,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        verticalSpacing(kSpacingSmall),

        StatefulBuilder(
          builder: (context, setState) {
            final TextEditingController textController = TextEditingController(
              text: description,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textController.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                if (textController.text.length >=
                    150) // Approximate length for 3 lines
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              content: SingleChildScrollView(
                                child: Text(
                                  textController.text,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                              ),
                            ),
                      );
                    },
                    child: Text(
                      'See More',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                        color: ColorManager.primaryBlue,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});
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
      ],
    );
  }
}
