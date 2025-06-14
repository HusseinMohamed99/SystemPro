import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:retrofit/retrofit.dart';
import 'package:system_pro/core/networking/backend/api_constants.dart';
import 'package:system_pro/core/networking/backend/api_success_model.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_response.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_response.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_response.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_response.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_response.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_request_body.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_response.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_response.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_response.dart';
import 'package:system_pro/features/Home/data/model/favorites/get_favorites_response.dart';
import 'package:system_pro/features/Home/data/model/favorites/toggle_favorite_response.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketplace_response.dart';
import 'package:system_pro/features/Home/data/model/user/user_data_response.dart';
import 'package:system_pro/features/Search/data/model/category_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// Authentication endpoints
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );

  @POST(ApiConstants.emailVerify)
  Future<EmailVerifyResponse> emailVerify(
    @Body() EmailVerifyRequestBody emailVerifyRequestBody,
  );

  @POST(ApiConstants.checkOtp)
  Future<CheckOtpResponse> checkOtp(
    @Body() CheckOtpRequestBody checkOtpRequestBody,
  );

  @POST(ApiConstants.resendOtp)
  Future<ResendOtpResponse> resendOtp(
    @Body() ResendOtpRequestBody resendOtpRequestBody,
  );

  @POST(ApiConstants.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequestBody changePasswordRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<ApiSuccessModel> logout();

  @POST(ApiConstants.deleteAccount)
  Future<ApiSuccessModel> deleteAccount();

  /// User data endpoints
  @GET(ApiConstants.getUserData)
  Future<UserDataResponse> getUserData();

  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponse> editProfile(
    @Body() EditProfileRequestBody editProfileRequestBody,
  );

  /// Marketplace endpoints
  @GET(ApiConstants.getMarketplaceListings)
  Future<MarketplaceResponse> getMarketplaceListings(
    @Queries() Map<String, dynamic> queryParams,
  );

  /// Favorites management endpoints
  @POST('${ApiConstants.addFavoriteRealEstate}/{id}')
  Future<ToggleFavoriteResponse> toggleFavorite(@Path('id') int listingId);

  @GET(ApiConstants.getFavoriteRealEstate)
  Future<GetFavoritesResponse> getFavoriteListings();

  /// Categories endpoint
  @GET(ApiConstants.getCategories)
  Future<CategoryResponse> getCategories({
    @Query('with_subcategories') bool withSubcategories = true,
  });
}

class AuthLocalService {
  AuthLocalService(this._storage);
  static const _tokenKey = 'access_token';

  final FlutterSecureStorage _storage;

  Future<void> removeToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }
}
