// ignore_for_file: non_constant_identifier_names, file_names
import 'package:json_annotation/json_annotation.dart';
import '../../BaseRequest.dart';
import 'WarehouseTakeoverBillDetailsGetResponse.dart';

part 'WarehouseTakeoverBillDetailsGetRequest.g.dart';

@JsonSerializable()
// 仓储托管账单详情获取请求.如果不指定bill id, 则直接从当前的情况中生成用于预览的临时账单信息.如果传入bill id,就是获取已经生成的账单信息.
class WareHouseTakeOverBillDetailsGetRequest
    extends BaseRequest<WareHouseTakeOverBillDetailsGetResponse> {
  /// <summary>
  /// 要查询哪个被托管的UserId的
  /// </summary>
  int? TakeoverWhoUserId;

  /// <summary>
  /// 已经创建了的仓储托管账单.该字段如果传入则获取已经产生的账单,如果不传入则获取预览账单.需要在用户保存之后才会生成bill id
  /// </summary>
  final int? BillId;

  /// <summary>
  /// 创建包裹的时间段的开始时间
  /// </summary>
  final DateTime? StartCreateTime;

  /// <summary>
  /// 创建包裹的时间段的结束时间
  /// </summary>
  final DateTime? EndCreateTime;

  /// 包裹发货时间查询起点.
  DateTime? StartSendTime;

  /// <summary>
  /// 包裹发货时间查询终端.
  /// </summary>
  DateTime? EndSendTime;

  /// <summary>
  /// 要查询的包裹号
  /// </summary>
  final int? Pid;

  /// <summary>
  /// 要查询的卖家账号
  /// </summary>
  final int? SellerId;

  /// <summary>
  /// 要查询的快递单号
  /// </summary>
  final String? WaybillCode;

  /// <summary>
  /// 页码大小
  /// </summary>
  int? PageSize;

  /// <summary>
  /// 页码标记,当前是第几页,从0开始!!!
  /// </summary>
  final int PageNum;

  /// <summary>
  /// 是否使用[是否包含下一页数据],如果不使用,将会在每次请求时返回总结果数
  /// </summary>
  final bool? UseHasNext;

  final bool? UseTotalRecordCount;

  WareHouseTakeOverBillDetailsGetRequest(
      {this.TakeoverWhoUserId,
      this.BillId,
      this.StartCreateTime,
      this.EndCreateTime,
      this.StartSendTime,
      this.EndSendTime,
      this.Pid,
      this.SellerId,
      this.WaybillCode,
      this.PageSize,
      required this.PageNum,
      this.UseHasNext,
        this.UseTotalRecordCount
      }) {
    // BillId = 1;
  }

  factory WareHouseTakeOverBillDetailsGetRequest.fromJson(
          Map<String, dynamic> json) =>
      _$WareHouseTakeOverBillDetailsGetRequestFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$WareHouseTakeOverBillDetailsGetRequestToJson(this);

  @override
  getParameters() {
    var json = toJson();
    return json;
  }

  @override
  parseResponse(rspJsonObj) {
    return WareHouseTakeOverBillDetailsGetResponse.fromJson(rspJsonObj);
  }

  @override
  getApiName() {
    return "qp.api.warehousetakeover.billdetail.get";
  }
}
