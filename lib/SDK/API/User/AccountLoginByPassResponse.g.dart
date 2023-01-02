// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountLoginByPassResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLoginByPassResponse _$AccountLoginByPassResponseFromJson(
        Map<String, dynamic> json) =>
    AccountLoginByPassResponse()
      ..ErrCode = json['ErrCode'] as String?
      ..ErrMsg = json['ErrMsg'] as String?
      ..SubErrCode = json['SubErrCode'] as String?
      ..SubErrMsg = json['SubErrMsg'] as String?
      ..Body = json['Body'] as String?
      ..Success = json['Success'] as bool?
      ..Session = json['Session'] as String?
      ..account = json['Account'] == null
          ? null
          : Account.fromJson(json['Account'] as Map<String, dynamic>);

Map<String, dynamic> _$AccountLoginByPassResponseToJson(
        AccountLoginByPassResponse instance) =>
    <String, dynamic>{
      'ErrCode': instance.ErrCode,
      'ErrMsg': instance.ErrMsg,
      'SubErrCode': instance.SubErrCode,
      'SubErrMsg': instance.SubErrMsg,
      'Body': instance.Body,
      'Success': instance.Success,
      'Session': instance.Session,
      'Account': instance.account,
    };
