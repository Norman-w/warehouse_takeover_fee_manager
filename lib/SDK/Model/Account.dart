// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'Account.g.dart';
@JsonSerializable()
//账户类
class Account {
      int? Id;
      String? Nick;
      int? UserId;
      String? UserNick;
      bool? IsSubUser;
      DateTime? RegTime;
      String? Status;
      String? Password;
      String? Name;
      String? Sex;
      String? Mobile;
      String? Phone;
      String? Avatar;
      String? Country;
      String? Province;
      String? City;
      String? Lang;
      String? Memo;
  Account();
  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}