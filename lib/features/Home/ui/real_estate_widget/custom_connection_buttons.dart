import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/make_call.dart';
import 'package:system_pro/core/helpers/functions/url_launcher.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';

class CustomConnectionButton extends StatelessWidget {
  const CustomConnectionButton({
    super.key,
    required this.whatsAppURL,
    required this.phoneURL,
  });

  final String whatsAppURL, phoneURL;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: kSpacingDefault.w,
      children: [
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: kPaddingMediumVertical.h,
              ),
              backgroundColor: customShowdBlueAndFourthBlackColor(context),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadiusMedium).r,
              ),
            ),
            onPressed: () async {
              await launchUrlWithPermission(
                context: context,
                url: 'https://wa.me/$whatsAppURL',
              );
            },
            icon: SvgPicture.asset(
              Assets.images.whatsapp,
              colorFilter: ColorFilter.mode(
                customPrimaryAndSecondaryBlueColor(context),
                BlendMode.srcIn,
              ),
            ),
            label: Text(
              context.localization.whatsApp,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),

        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: kPaddingMediumVertical.h,
              ),
              backgroundColor: customShowdBlueAndFourthBlackColor(context),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              makePhoneCall(context, phoneURL);
            },
            icon: SvgPicture.asset(
              Assets.images.phone,
              colorFilter: ColorFilter.mode(
                customPrimaryAndSecondaryBlueColor(context),
                BlendMode.srcIn,
              ),
            ),
            label: Text(
              context.localization.call,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
