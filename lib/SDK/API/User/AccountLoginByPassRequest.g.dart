// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountLoginByPassRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLoginByPassRequest _$AccountLoginByPassRequestFromJson(
        Map<String, dynamic> json) =>
    AccountLoginByPassRequest()
      ..NickMobileId = json['NickMobileId'] as String?
      ..Pass = json['Pass'] as String?
      ..Clint = json['Clint'] as String?
      ..AppCode = json['AppCode'] as String?
      ..SessionType = json['SessionType'] as String?;

Map<String, dynamic> _$AccountLoginByPassRequestToJson(
        AccountLoginByPassRequest instance) =>
    <String, dynamic>{
      'NickMobileId': instance.NickMobileId,
      'Pass': instance.Pass,
      'Clint': instance.Clint,
      'AppCode': instance.AppCode,
      'SessionType': instance.SessionType,
    };
