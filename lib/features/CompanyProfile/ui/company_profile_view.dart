import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_sliver_list.dart';

class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: BlocBuilder<RealEstateCubit, RealEstateState>(
        builder: (context, state) {
          if (state is FilteredListingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FilteredListingsError) {
            return Center(child: Text(state.error));
          } else if (state is FilteredListingsSuccess) {
            final listings = state.filteredListings;

            if (listings.isEmpty || listings.first.company == null) {
              return const Center(child: Text('No company data found.'));
            }

            final company = listings.first.company!;
            final companyListings =
                listings.where((l) => l.company?.id == company.id).toList();

            return Column(
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
                            imageURL: company.picture ?? '',
                            height: 32.h,
                            width: 100.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      verticalSpacing(kSpacingDefault),
                      Text(
                        company.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      verticalSpacing(kSpacingSmall),
                      Text(
                        '${companyListings.length} ${context.localization.properties}',

                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
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
                        child: LocationWidget(location: company.address ?? ''),
                      ),
                      SliverToBoxAdapter(
                        child: verticalSpacing(kSpacingDefault),
                      ),
                      SliverToBoxAdapter(
                        child: AboutRealEstateWidget(
                          description: company.bio ?? '',
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
                      SliverToBoxAdapter(
                        child: verticalSpacing(kSpacingDefault),
                      ),
                      SliverToBoxAdapter(
                        child: PropertiesWidget(
                          propertyLength: companyListings.length.toString(),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: verticalSpacing(kSpacingDefault),
                      ),
                      RealEstateSliverList(listings: companyListings),
                    ],
                  ),
                ),
              ],
            ).hPadding(kPaddingDefaultHorizontal);
          }

          return const SizedBox(); // fallback if not matched
        },
      ),
    );
  }
}

class PropertiesWidget extends StatelessWidget {
  const PropertiesWidget({super.key, required this.propertyLength});
  final String propertyLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.properties,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        verticalSpacing(kSpacingLarge),
        Text(
          '$propertyLength ${context.localization.properties}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.softGray,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
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
