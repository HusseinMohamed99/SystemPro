import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        // style: TextStyleManager.bold13(context: context),
      ),
    );
  }
}
