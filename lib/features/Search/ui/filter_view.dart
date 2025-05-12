import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/ui/widgets/filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key, required this.locationArgument});
  final LocationArgument locationArgument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(
        context,
        title: context.localization.filter,
        textColor:  AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureBlack,
          darkColor: ColorManager.pureWhite,
        ),
      ),
      body:FilterViewBody(locationArgument: locationArgument).allPadding(
        vPadding: kPaddingDefaultVertical,
        hPadding: kPaddingDefaultHorizontal,
      ),
    );
  }
}
