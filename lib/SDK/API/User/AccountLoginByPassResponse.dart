// ignore_for_file: non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';
import '../../BaseResponse.dart';
import '../../Model/Account.dart';

part 'AccountLoginByPassResponse.g.dart';

@JsonSerializable()
// 仓储托管账单查询接口
class AccountLoginByPassResponse extends BaseResponse {

  bool? Success;

  String? Session;

  @JsonKey(name:"Account")
  Account? account;

  AccountLoginByPassResponse();

  factory AccountLoginByPassResponse.fromJson(
      Map<String, dynamic> json) =>
      _$AccountLoginByPassResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AccountLoginByPassResponseToJson(this);
}
