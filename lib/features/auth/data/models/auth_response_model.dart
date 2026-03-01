class AuthResponseModel {
  AuthResponseModel({
    required this.userId,
    required this.email,
    this.token,
  });

  final String userId;
  final String email;
  final String? token;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      userId: (json['userId'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      token: json['token']?.toString(),
    );
  }
}
