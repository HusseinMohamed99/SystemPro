import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_item.dart';

class RealEstateSliverList extends StatelessWidget {
  const RealEstateSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              context.pushNamed(Routes.companyProfileView);
            },
            child: const RealEstateItem(),
          ),
      separatorBuilder: (context, index) => verticalSpacing(kSpacingDefault),
      itemCount: 10,
    );
  }
}
