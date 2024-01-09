import 'package:json_annotation/json_annotation.dart';

part 'sign_user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUserModel {
  final String username;
  final String password1;
  final String password2;
  final String email;
  final String token;

  SignUserModel(
      {required this.username,
      required this.email,
      required this.password1,
      required this.password2,this.token=''});

  factory SignUserModel.fromJson(Map<String, dynamic> json) =>
      _$SignUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUserModelToJson(this);

  String get _name => username ?? '';

  SignUserModel copyWith(
  {String? username, String? password1, String? password2, String? email,String? token}) {
    return SignUserModel(
        username: username ?? this.username,
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2,
        token: token?? this.token
    );
  }
}
