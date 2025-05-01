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
