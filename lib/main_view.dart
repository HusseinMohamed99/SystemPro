import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 60,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                final themingCubit = context.read<ChangeThemingCubit>();
                themingCubit.toggleTheme(); // دي هتكون دالة بتبدل بين الثيمات
              },
              child: Text(
                context.localization.email_already_exists,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () {
                final localeCubit = context.read<ChangeLocalizationCubit>();
                localeCubit.changeLocalization();
              },
              child: Text(context.localization.do_not_have_account),
            ),
          ],
        ),
      ),
    );
  }
}
