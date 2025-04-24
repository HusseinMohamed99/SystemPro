import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.showSnackBar(context.localization.sign_in_successfully);
            // context.pushReplacementNamed(Routes.mainView);
          }
          if (state is LoginError) {
            context.showSnackBar(state.error);
          }
        },
        builder: (context, state) {
          return LoadingIndicator(
            isLoading: state is LoginLoading ? true : false,
            child: const LoginViewBody().allPadding(
              vPadding: kPaddingLargeVertical,
              hPadding: kPaddingDefaultHorizontal,
            ),
          );
        },
      ),
    );
  }
}

//  @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LoginCubit, LoginState>(
//       listener: (context, state) {
//         if (state is LoginSuccess) {
//           context.showSnackBar(context.localization.sign_in_successfully);
//           // context.pushReplacementNamed(Routes.mainView);
//         }
//         if (state is LoginError) {
//           context.showSnackBar(state.error);
//         }
//       },
//       builder: (context, state) {
//         return LoadingIndicator(
//           isLoading: state is LoginLoading ? true : false,
//           child: const LoginViewBody(),
//         );
//       },
//     );
//   }
// }
