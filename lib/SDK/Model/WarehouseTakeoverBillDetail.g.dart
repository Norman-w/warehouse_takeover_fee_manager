// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WarehouseTakeoverBillDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseTakeoverBillDetail _$WarehouseTakeoverBillDetailFromJson(
        Map<String, dynamic> json) =>
    WarehouseTakeoverBillDetail(
      Id: json['Id'] as int?,
      BillId: json['BillId'] as int?,
      Pid: json['Pid'] as int,
      Assignor: json['Assignor'] as int,
      SellerId: json['SellerId'] as int,
      BagCreateTime: DateTime.parse(json['BagCreateTime'] as String),
      BagSendTime: DateTime.parse(json['BagSendTime'] as String),
      DetailCreateTime: json['DetailCreateTime'] == null
          ? null
          : DateTime.parse(json['DetailCreateTime'] as String),
      DetailLastModifiedTime: json['DetailLastModifiedTime'] == null
          ? null
          : DateTime.parse(json['DetailLastModifiedTime'] as String),
      Weight: (json['Weight'] as num?)?.toDouble(),
      VolumetricWeight: (json['VolumetricWeight'] as num?)?.toDouble(),
      WaybillCode: json['WaybillCode'] as String?,
      PostFee: (json['PostFee'] as num?)?.toDouble(),
      ItemKindCount: json['ItemKindCount'] as int?,
      TotalItemCount: json['TotalItemCount'] as int?,
      PackingFee: (json['PackingFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarehouseTakeoverBillDetailToJson(
        WarehouseTakeoverBillDetail instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'BillId': instance.BillId,
      'Pid': instance.Pid,
      'SellerId': instance.SellerId,
      'Assignor': instance.Assignor,
      'BagCreateTime': instance.BagCreateTime.toIso8601String(),
      'BagSendTime': instance.BagSendTime.toIso8601String(),
      'DetailCreateTime': instance.DetailCreateTime?.toIso8601String(),
      'DetailLastModifiedTime':
          instance.DetailLastModifiedTime?.toIso8601String(),
      'Weight': instance.Weight,
      'VolumetricWeight': instance.VolumetricWeight,
      'WaybillCode': instance.WaybillCode,
      'PostFee': instance.PostFee,
      'ItemKindCount': instance.ItemKindCount,
      'TotalItemCount': instance.TotalItemCount,
      'PackingFee': instance.PackingFee,
    };
