import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_view_body.dart';
import 'package:system_pro/generated/intl/messages_ar.dart';

// class LoginBlocListener extends StatelessWidget {
//   const LoginBlocListener({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginCubit, LoginState>(
//       listenWhen:
//           (previous, current) =>
//               current is LoginLoading ||
//               current is LoginSuccess ||
//               current is LoginError,
//       listener: (context, state) {
//         state.whenOrNull(
//           loginLoading: () {
//             loadingDialog(context);
//           },
//           loginSuccess: (loginResponse) {
//             context.pop();
//             context.showSnackBar(loginResponse.message ?? '');
//             if (loginResponse.userData.token != null &&
//                 loginResponse.userData.emailVerified == true) {
//               // context.pushNamedAndRemoveUntil(
//               //   Routes.layoutView,
//               //   predicate: (Route<dynamic> route) => false,
//               // );
//             } else if (loginResponse.userData.token != null &&
//                 loginResponse.userData.emailVerified == false) {
//               // context.pushReplacementNamed(
//               //   Routes.emailVerifyView,
//               //   arguments: EmailVerifyArgModel(
//               //     email: loginResponse.userData.email,
//               //     token: loginResponse.userData.token,
//               //   ),
//               // );
//             }
//           },
//           loginError: (error) {
//             CustomErrorWidget(errorMessage: error,);
//           },
//         );
//       },
//       child: const SizedBox.shrink(),
//     );
//   }
// }



