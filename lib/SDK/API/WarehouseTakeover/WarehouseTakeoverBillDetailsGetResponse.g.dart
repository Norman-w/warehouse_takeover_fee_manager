// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WarehouseTakeoverBillDetailsGetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareHouseTakeOverBillDetailsGetResponse
    _$WareHouseTakeOverBillDetailsGetResponseFromJson(
            Map<String, dynamic> json) =>
        WareHouseTakeOverBillDetailsGetResponse()
          ..ErrCode = json['ErrCode'] as String?
          ..ErrMsg = json['ErrMsg'] as String?
          ..SubErrCode = json['SubErrCode'] as String?
          ..SubErrMsg = json['SubErrMsg'] as String?
          ..Body = json['Body'] as String?
          ..Details = (json['Details'] as List<dynamic>)
              .map((e) => WarehouseTakeoverBillDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          ..TotalRecordCount = json['TotalRecordCount'] as int?
          ..HasNext = json['HasNext'] as bool?;

Map<String, dynamic> _$WareHouseTakeOverBillDetailsGetResponseToJson(
        WareHouseTakeOverBillDetailsGetResponse instance) =>
    <String, dynamic>{
      'ErrCode': instance.ErrCode,
      'ErrMsg': instance.ErrMsg,
      'SubErrCode': instance.SubErrCode,
      'SubErrMsg': instance.SubErrMsg,
      'Body': instance.Body,
      'Details': instance.Details,
      'TotalRecordCount': instance.TotalRecordCount,
      'HasNext': instance.HasNext,
    };
