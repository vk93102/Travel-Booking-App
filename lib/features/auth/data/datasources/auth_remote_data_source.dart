import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/otp_request_model.dart';
import '../models/signup_request_model.dart';

/// Contract for remote auth APIs.
abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);

  Future<AuthResponseModel> signup(SignupRequestModel request);

  Future<void> sendOtp(OtpRequestModel request);

  Future<AuthResponseModel> verifyOtp(OtpRequestModel request);
}

/// API-backed implementation.
///
/// Endpoint paths are centralized in [ApiEndpoints].
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await _apiClient.post(
      ApiEndpoints.login,
      body: request.toJson(),
    );
    return AuthResponseModel.fromJson(response);
  }

  @override
  Future<AuthResponseModel> signup(SignupRequestModel request) async {
    final response = await _apiClient.post(
      ApiEndpoints.signup,
      body: request.toJson(),
    );
    return AuthResponseModel.fromJson(response);
  }

  @override
  Future<void> sendOtp(OtpRequestModel request) async {
    await _apiClient.post(
      ApiEndpoints.sendOtp,
      body: request.toJson(),
    );
  }

  @override
  Future<AuthResponseModel> verifyOtp(OtpRequestModel request) async {
    final response = await _apiClient.post(
      ApiEndpoints.verifyOtp,
      body: request.toJson(),
    );
    return AuthResponseModel.fromJson(response);
  }
}
