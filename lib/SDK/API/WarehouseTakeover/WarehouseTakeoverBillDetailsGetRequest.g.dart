// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WarehouseTakeoverBillDetailsGetRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareHouseTakeOverBillDetailsGetRequest
    _$WareHouseTakeOverBillDetailsGetRequestFromJson(
            Map<String, dynamic> json) =>
        WareHouseTakeOverBillDetailsGetRequest(
          TakeoverWhoUserId: json['TakeoverWhoUserId'] as int?,
          BillId: json['BillId'] as int?,
          StartCreateTime: json['StartCreateTime'] == null
              ? null
              : DateTime.parse(json['StartCreateTime'] as String),
          EndCreateTime: json['EndCreateTime'] == null
              ? null
              : DateTime.parse(json['EndCreateTime'] as String),
          StartSendTime: json['StartSendTime'] == null
              ? null
              : DateTime.parse(json['StartSendTime'] as String),
          EndSendTime: json['EndSendTime'] == null
              ? null
              : DateTime.parse(json['EndSendTime'] as String),
          Pid: json['Pid'] as int?,
          SellerId: json['SellerId'] as int?,
          WaybillCode: json['WaybillCode'] as String?,
          PageSize: json['PageSize'] as int?,
          PageNum: json['PageNum'] as int,
          UseHasNext: json['UseHasNext'] as bool?,
          UseTotalRecordCount: json['UseTotalRecordCount'] as bool?,
        );

Map<String, dynamic> _$WareHouseTakeOverBillDetailsGetRequestToJson(
        WareHouseTakeOverBillDetailsGetRequest instance) =>
    <String, dynamic>{
      'TakeoverWhoUserId': instance.TakeoverWhoUserId,
      'BillId': instance.BillId,
      'StartCreateTime': instance.StartCreateTime?.toIso8601String(),
      'EndCreateTime': instance.EndCreateTime?.toIso8601String(),
      'StartSendTime': instance.StartSendTime?.toIso8601String(),
      'EndSendTime': instance.EndSendTime?.toIso8601String(),
      'Pid': instance.Pid,
      'SellerId': instance.SellerId,
      'WaybillCode': instance.WaybillCode,
      'PageSize': instance.PageSize,
      'PageNum': instance.PageNum,
      'UseHasNext': instance.UseHasNext,
      'UseTotalRecordCount': instance.UseTotalRecordCount,
    };
