import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomPinputOtpCodeWidget extends StatelessWidget {
  const CustomPinputOtpCodeWidget({
    super.key,
    required this.validationCodeController,
  });

  final TextEditingController validationCodeController;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 3,
          width: 30,
          margin: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: ColorManager.pureBlack,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
          ),
        ),
      ),
      controller: validationCodeController,
      validator: (value) {
        return ValidationManager.otpValidator(context, value);
      },
      defaultPinTheme: PinTheme(
        width: 77.w,
        height: 77.h,
        textStyle: Theme.of(context).textTheme.headlineLarge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.grey),
        ),
      ),
      errorPinTheme: PinTheme(
        width: 77.w,
        height: 77.h,
        textStyle: Theme.of(context).textTheme.headlineLarge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.errorRed),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 77.w,
        height: 77.h,
        textStyle: Theme.of(context).textTheme.headlineLarge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5),
        ),
      ),
    );
  }
}
