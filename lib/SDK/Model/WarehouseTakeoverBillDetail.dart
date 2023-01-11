// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'WarehouseTakeoverBillDetail.g.dart';
@JsonSerializable()
///仓储托管记录详情条目
class WarehouseTakeoverBillDetail {
  /// <summary>
  /// 条目编号
  /// </summary>
  final int? Id;

  /// <summary>
  /// ParentId,仓储托管账单的账单号,在创建本条目并将本条目从临时升级为正式(开始计算)的时候就可以保存这个字段了.
  /// </summary>
  final int? BillId;

  /// <summary>
  /// 包裹号
  /// </summary>
  final int Pid;

  /// <summary>
  /// 卖家ID
  /// </summary>
  final int SellerId;

  ///被托管的UserId
  final int Assignor;

  /// <summary>
  /// 包裹创建时间
  /// </summary>
  final DateTime BagCreateTime;

  /// <summary>
  /// 包裹发货时间
  /// </summary>
  final DateTime BagSendTime;

  /// <summary>
  /// 本条记录的创建时间,只有在开始拢账的时候该条账单才被创建
  /// </summary>
  final DateTime? DetailCreateTime;

  /// <summary>
  /// 本条记录的最后修改时间,这个字段可以没有 没啥用
  /// </summary>
  final DateTime? DetailLastModifiedTime;

  /// <summary>
  /// 重量
  /// </summary>
  final double? Weight;

  /// <summary>
  /// 记录泡货的重量,如果包裹被记录为泡货会有这个重量.
  /// </summary>
  final double? VolumetricWeight;

  /// <summary>
  /// 包裹发货的快递单号
  /// </summary>
  final String? WaybillCode;

  /// <summary>
  /// 快递费
  /// </summary>
  final double? PostFee;

  /// <summary>
  /// 商品种类数
  /// </summary>
  final int? ItemKindCount;

  /// <summary>
  /// 该包裹中总计有多少个商品.
  /// </summary>
  final int? TotalItemCount;

  /// <summary>
  /// 包装费,也就是仓储托管的费用,要收多少钱,一般的小件都是1元.
  /// </summary>
  final double? PackingFee;

  WarehouseTakeoverBillDetail(
      {
        this.Id,
        this.BillId,
        required this.Pid,
        required this.Assignor,
        required this.SellerId,
        required this.BagCreateTime,
        required this.BagSendTime,
        this.DetailCreateTime,
        this.DetailLastModifiedTime,
        this.Weight,
        this.VolumetricWeight,
        this.WaybillCode,
        this.PostFee,
        required this.ItemKindCount,
        required this.TotalItemCount,
        this.PackingFee
      }
      );
  factory WarehouseTakeoverBillDetail.fromJson(Map<String, dynamic> json) => _$WarehouseTakeoverBillDetailFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WarehouseTakeoverBillDetailToJson(this);
}