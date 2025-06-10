import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_state.dart';
import 'package:system_pro/features/Home/ui/profile_widgets/custom_profile_card_list.dart';
import 'package:system_pro/features/Home/ui/profile_widgets/custom_profile_info.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileDataState>(
      listener: (context, state) {
        if (state is UserDataError) {
          context.showSnackBar(state.error);
        }
        if (state is LogoutSuccess) {
          context.showSnackBar(context.localization.logout_successfully);
          context.pushNamedAndRemoveUntil(
            Routes.loginView,
            predicate: (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is UserDataSuccess) {
          final user = state.data.userData;
          return Column(
            children: [
              Center(
                child: Text(
                  context.localization.profile,
                  textAlign: TextAlign.center,
                  style: context.headlineMedium?.copyWith(
                    color: customPrimaryBlueAndWhiteColor(context),
                  ),
                ),
              ),
              verticalSpacing(kSpacingXLarge),
              CustomProfileInfo(userName: user?.userName, email: user?.email),
              verticalSpacing(kSpacingDefault),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    CustomProfileCardList(userName: user?.userName),
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: TextButton(
                          onPressed: () {
                            context.read<ProfileCubit>().emitLogoutStates();
                            DioFactory.clearAuthorizationHeader();
                          },
                          child: Text(
                            context.localization.logout,
                            style: context.titleLarge?.copyWith(
                              fontWeight: FontWeightHelper.medium,
                              color: customPrimaryAndSecondaryBlueColor(
                                context,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is UserDataLoading) {
          return const CustomLoader(type: LoaderType.adaptive);
        } else if (state is UserDataError) {
          return CustomErrorTextWidget(
            errorMessage: state.error,
            onRetry: () => context.read<ProfileCubit>().emitGetProfileStates(),
          );
        }
        return const SizedBox.shrink();
      },
    ).allPadding(
      vPadding: kPaddingDefaultVertical,
      hPadding: kPaddingDefaultHorizontal,
    );
  }
}
