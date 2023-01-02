// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account()
  ..Id = json['Id'] as int?
  ..Nick = json['Nick'] as String?
  ..UserId = json['UserId'] as int?
  ..UserNick = json['UserNick'] as String?
  ..IsSubUser = json['IsSubUser'] as bool?
  ..RegTime =
      json['RegTime'] == null ? null : DateTime.parse(json['RegTime'] as String)
  ..Status = json['Status'] as String?
  ..Password = json['Password'] as String?
  ..Name = json['Name'] as String?
  ..Sex = json['Sex'] as String?
  ..Mobile = json['Mobile'] as String?
  ..Phone = json['Phone'] as String?
  ..Avatar = json['Avatar'] as String?
  ..Country = json['Country'] as String?
  ..Province = json['Province'] as String?
  ..City = json['City'] as String?
  ..Lang = json['Lang'] as String?
  ..Memo = json['Memo'] as String?;

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'Id': instance.Id,
      'Nick': instance.Nick,
      'UserId': instance.UserId,
      'UserNick': instance.UserNick,
      'IsSubUser': instance.IsSubUser,
      'RegTime': instance.RegTime?.toIso8601String(),
      'Status': instance.Status,
      'Password': instance.Password,
      'Name': instance.Name,
      'Sex': instance.Sex,
      'Mobile': instance.Mobile,
      'Phone': instance.Phone,
      'Avatar': instance.Avatar,
      'Country': instance.Country,
      'Province': instance.Province,
      'City': instance.City,
      'Lang': instance.Lang,
      'Memo': instance.Memo,
    };
