import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  final UserData data;
  final bool status;
  final int code;

  LoginResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({
    required this.token,
    required this.userName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
