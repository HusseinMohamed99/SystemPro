import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:system_pro/core/networking/backend/api_constants.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_request_body.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_response.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
