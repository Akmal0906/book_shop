// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUserModel _$SignUserModelFromJson(Map<String, dynamic> json) =>
    SignUserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      password1: json['password1'] as String,
      password2: json['password2'] as String,
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$SignUserModelToJson(SignUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password1': instance.password1,
      'password2': instance.password2,
      'email': instance.email,
      'token': instance.token,
    };
