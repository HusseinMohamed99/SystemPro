import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/gen/assets.gen.dart';

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
                const SliverToBoxAdapter(child: LocationWidget()),
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

class AboutRealEstate extends StatelessWidget {
  const AboutRealEstate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingDefault.h,
      children: [
        Row(
          spacing: kSpacingDefault.w,
          children: [
            Text(
              '${context.localization.sar} 3,143,000',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: ColorManager.primaryBlue,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorManager.borderGrey,
                  width: 1.5.w,
                ),
              ),
              child: Text(
                '20% Down Payment',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: ColorManager.softGray,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Fully finished apartment 65m for sale in Madinaty',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: ColorManager.softGray,
              size: kIconSizeDefault.sp,
            ),
            Text(
              'Privado, Madinaty',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
            const Spacer(),
            Text(
              '19/03/2025',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
          ],
        ),
        Wrap(
          spacing: kSpacingDefault.w, // المسافة الأفقية بين العناصر
          runSpacing: kSpacingSmall.h, // المسافة الرأسية بين الأسطر
          children: List.generate(4, (index) {
            final images = [
              Assets.images.buildingApartment,
              Assets.images.bed,
              Assets.images.bathroom,
              Assets.images.area,
            ];
            final values = ['Apartment', '3', '2', '176 sqm'];

            return Row(
              mainAxisSize: MainAxisSize.min, // مهم لتجنب أخذ كل العرض
              children: [
                SvgPicture.asset(images[index]),
                horizontalSpacing(kSpacingSmall.w),
                Text(
                  values[index],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: ColorManager.softGray,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.description,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        verticalSpacing(kSpacingSmall),

        StatefulBuilder(
          builder: (context, setState) {
            final TextEditingController textController = TextEditingController(
              text:
                  'At Mastermind Real estate , we specialize in helping clients buy, sell, and invest in real estate with confidence. With a focus on quality and expertise, we have a team of experienced professionals who are dedicated to helping our clients achieve their real estate goals. Whether you are looking to buy, sell, or invest in real estate, we have the resources and expertise to help you succeed. Contact us today to learn more about how we can help you achieve your real estate goals.',
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

class PurposeWidget extends StatelessWidget {
  const PurposeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.purpose,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),

        Text(
          'For ${context.localization.rent}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.amenities,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Wrap(
          spacing: kSpacingXLarge.w,
          runSpacing: kSpacingSmall.h,
          children: List.generate(4, (index) {
            final strings = [
              'Central A/C',
              'Security',
              'Swimming Pool',
              'Garden',
            ];
            return SizedBox(
              width: context.width * 0.40,
              child: Text(
                strings[index],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ListedByWidget extends StatelessWidget {
  const ListedByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.listed_by,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: kSpacingXLarge.h),
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
          ),
          child: Column(
            spacing: kSpacingDefault.h,
            children: [
              Image.asset(
                Assets.images.image2Png.path,
                width: 120.w,
                height: 40.h,
                fit: BoxFit.fitHeight,
              ),
              Text(
                'Mastermind Real estate',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              Divider(
                color: ColorManager.borderGrey,
                thickness: 1.5.w,
              ).hPadding(kSpacingDefault.w),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.companyProfileView);
                },
                child: Text(
                  context.localization.view_profile,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: ColorManager.primaryBlue,
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

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.location,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: ColorManager.softGray,
              size: kIconSizeDefault.sp,
            ),
            Text(
              'Privado, Madinaty',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
          ],
        ),
        Container(
          width: context.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(Assets.images.map.path),
              Positioned(
                child: TextButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  label: Text(
                    context.localization.see_location,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  icon: Icon(
                    Icons.place_outlined,
                    color: ColorManager.softGray,
                    size: kIconSizeDefault.sp,
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

class RealEstateDetailsImage extends StatefulWidget {
  const RealEstateDetailsImage({super.key});

  @override
  State<RealEstateDetailsImage> createState() => _RealEstateDetailsImageState();
}

class _RealEstateDetailsImageState extends State<RealEstateDetailsImage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> imagePaths = [
    Assets.images.image1.path,
    Assets.images.image1.path,
    Assets.images.image1.path,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image slider
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: SizedBox(
            height: 250.h,
            width: context.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.fill,
                  height: 250.h,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: context.height * .07,
          left: 20.w,
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingSmallHorizontal.w,
                vertical: kPaddingSmallVertical.h,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.pureWhite,
              ),
              child: Icon(Icons.arrow_back_ios_new, size: 16.sp),
            ),
          ),
        ),
        // Dots Indicator
        Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imagePaths.length, (index) {
              final isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      isActive
                          ? ColorManager.primaryBlue
                          : ColorManager.pureWhite,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
