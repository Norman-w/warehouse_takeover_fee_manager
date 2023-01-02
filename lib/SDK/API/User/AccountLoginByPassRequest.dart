// ignore_for_file: non_constant_identifier_names, file_names
import 'package:json_annotation/json_annotation.dart';
import '../../BaseRequest.dart';
import 'AccountLoginByPassResponse.dart';

part 'AccountLoginByPassRequest.g.dart';


@JsonSerializable()
// 使用用户名和密码登录获取session
class AccountLoginByPassRequest
    extends BaseRequest<AccountLoginByPassResponse> {
  String? NickMobileId;
  String? Pass;
  String? Clint;
  String? AppCode;
  String? SessionType;

  AccountLoginByPassRequest();

  factory AccountLoginByPassRequest.fromJson(
      Map<String, dynamic> json) =>
      _$AccountLoginByPassRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AccountLoginByPassRequestToJson(this);

  @override
  getParameters() {
    var json = toJson();
    return json;
  }

  @override
  parseResponse(rspJsonObj) {
    return AccountLoginByPassResponse.fromJson(rspJsonObj);
  }

  @override
  getApiName() {
    return "qp.api.account.login.bypass";
  }
}
