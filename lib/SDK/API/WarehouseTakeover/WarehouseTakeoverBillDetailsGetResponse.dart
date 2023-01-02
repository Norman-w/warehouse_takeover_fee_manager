// ignore_for_file: non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';
import '../../Model/WarehouseTakeoverBillDetail.dart';
import '../../BaseResponse.dart';

part 'WarehouseTakeoverBillDetailsGetResponse.g.dart';

@JsonSerializable()
// 仓储托管账单查询接口
class WareHouseTakeOverBillDetailsGetResponse extends BaseResponse {
  /// <summary>
  /// 当前获取到的结果
  /// </summary>
  List<WarehouseTakeoverBillDetail> Details = [];

  /// <summary>
  /// 总计有多少记录条数
  /// </summary>
  int? TotalRecordCount = 0;

  /// <summary>
  /// 是否还有下一页
  /// </summary>
  bool? HasNext;

  WareHouseTakeOverBillDetailsGetResponse();

  factory WareHouseTakeOverBillDetailsGetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$WareHouseTakeOverBillDetailsGetResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$WareHouseTakeOverBillDetailsGetResponseToJson(this);
}
