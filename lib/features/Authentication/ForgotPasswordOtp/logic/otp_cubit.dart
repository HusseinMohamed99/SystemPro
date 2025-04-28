import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/repo/otp_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._otpRepo) : super(const OtpState.initial());
  final OtpRepo _otpRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController validationCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitResendOtpStates(ResendOtpRequestBody resendOtpRequestBody) async {
    emit(const OtpState.otpLoading());
    final response = await _otpRepo.resendOtp(resendOtpRequestBody);
    response.when(
      success: (otpResponse) {
        emit(OtpState.otpSuccess(otpResponse));
      },
      failure: (error) {
        emit(OtpState.otpError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void emitCheckOtpStates(CheckOtpRequestBody checkOtpRequestBody) async {
    emit(const OtpState.otpLoading());
    final response = await _otpRepo.checkOtp(checkOtpRequestBody);
    response.when(
      success: (checkOtpResponse) {
        emit(OtpState.otpSuccess(checkOtpResponse));
      },
      failure: (error) {
        emit(OtpState.otpError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
