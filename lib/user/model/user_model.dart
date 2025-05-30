import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:mma_flutter/common/model/request_model.dart';

part 'user_model.g.dart';

abstract class UserModelBase extends RequestModelBase{}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({required this.message});
}

class UserModelLoading extends UserModelBase{}

class UserModelNicknameSetting extends UserModelBase{}

@JsonSerializable()
class UserModel extends UserModelBase {
  final int id;
  final String? nickname;
  final String email;

  UserModel({required this.id, required this.nickname, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json)
  => _$UserModelFromJson(json);

}
