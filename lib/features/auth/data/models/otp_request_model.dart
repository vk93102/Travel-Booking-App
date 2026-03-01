class OtpRequestModel {
  OtpRequestModel({required this.phoneNumber, this.code});

  final String phoneNumber;
  final String? code;

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        if (code != null) 'code': code,
      };
}
