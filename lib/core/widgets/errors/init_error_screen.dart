import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';

class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
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
                style:  context.titleLarge?.copyWith(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
               verticalSpacing( 20),
              ElevatedButton(
                onPressed: SystemNavigator.pop, // لإغلاق التطبيق
                child:  Text('إغلاق التطبيق',style: context.titleLarge?.copyWith(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
