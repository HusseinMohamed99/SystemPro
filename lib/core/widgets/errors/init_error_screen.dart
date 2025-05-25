import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 64.sp,
                color: ColorManager.errorRed,
              ),
              verticalSpacing(16),
              Text(
                'حدث خطأ أثناء تهيئة التطبيق',
                style: context.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpacing(12),
              Text(
                error,
                style: context.titleLarge?.copyWith(
                  color: ColorManager.errorRed,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpacing(20),
              ElevatedButton(
                onPressed: SystemNavigator.pop,
                child: Text(
                  'إغلاق التطبيق',
                  style: context.titleLarge?.copyWith(
                    color: ColorManager.pureWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
