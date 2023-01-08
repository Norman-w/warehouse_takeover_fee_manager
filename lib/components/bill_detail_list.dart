import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:warehouse_takeover_fee_manager/common/global.dart';

import '../SDK/API/WarehouseTakeover/WarehouseTakeoverBillDetailsGetRequest.dart';
import '../SDK/API/WarehouseTakeover/WarehouseTakeoverBillDetailsGetResponse.dart';
import '../SDK/Model/WarehouseTakeoverBillDetail.dart';
import '../SDK/SDKClient.dart';
import '../utils/time.dart';

//组件声明
class BillDetailList extends StatefulWidget {
  const BillDetailList({Key? key}) : super(key: key);

  @override
  State<BillDetailList> createState() => _BillDetailListState();
}



//region sdk客户端
SDKClient sdkClient = SDKClient(
    "https://enni.group/netserver/router.aspx?");
//endregion


//region 定义列头
//列的信息根据是否需要动态修改选择定义位置.如果在dart文件下直接定义而不是在 Widget build 方法中,则不会每次修改代码直接刷新.
//也可以跟row信息一样在异步数据返回后调用获取列信息.没有发现影响性能.
getDataGridColumns(){
  return <GridColumn>[
  GridColumn(
      width: 80,
      columnName: '编号',
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            '编号',
          ))),
  GridColumn(
      width: 80,
      columnName: '包裹号',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text(
            '包裹号',
          ))),
  GridColumn(
      width: 120,
      columnName: '创建时间',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text(
            '创建时间',
          ))),
  GridColumn(
      width: 120,
      columnName: '发货时间',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text(
            '发货时间',
          ))),
  GridColumn(
      width: 200,
      columnName: '快递单号',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text(
            '快递单号',
          ))),
  GridColumn(
      columnName: '商品种类',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text(
            '商品种类',
          ))),
  GridColumn(
      columnName: '总件数',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text('总件数'))),
    GridColumn(
        columnName: '被托管者',
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text('被托管者'))),
  GridColumn(
      columnName: '卖家',
      width: 120,
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text('卖家'))),
  GridColumn(
      columnWidthMode: ColumnWidthMode.fill,
      columnName: '重量',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text('重量'))),
  GridColumn(
      columnWidthMode: ColumnWidthMode.fill,
      columnName: '泡重',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text('泡重'))),
  GridColumn(
      columnWidthMode: ColumnWidthMode.fill,
      columnName: '快递费',
      label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: const Text('快递费'))),
  GridColumn(
      columnWidthMode: ColumnWidthMode.fill,
      columnName: '包装费',
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.centerRight,
          child: const Text('包装费'))),
];
}
// var billDetailsColumns = getDataGridColumns();
//endregion


//region 数据源处理 从返回的response.Details创建用于sfDataGrid显示的数据源
class BillDetailsDataSource extends DataGridSource {
  List<DataGridRow> billDetailsRows = [];

  BillDetailsDataSource({List<WarehouseTakeoverBillDetail>? billDetails}) {
    // billDetailsRows = billDetails.map((e)
    // {
    //   return DataGridRow(cells: [
    //     DataGridCell<int>(columnName: "Id", value: e.Id)
    //   ]);
    // }
    // ).toList();
    if (billDetails != null) {
      billDetailsRows = billDetails
          .map((e) => DataGridRow(cells: [
                // DataGridCell<int>(columnName: "账单号", value: e.Id),
                DataGridCell<int>(columnName: "编号", value: e.Id),
                DataGridCell(columnName: "包裹号", value: e.Pid),
                DataGridCell(columnName: "创建时间", value: timeToCNDay(e.BagCreateTime)),
                DataGridCell(columnName: "发货时间", value: timeToCNDay(e.BagSendTime)),
                DataGridCell(columnName: "快递单号", value: e.WaybillCode),
                DataGridCell(columnName: "商品种类", value: e.ItemKindCount),
                DataGridCell(columnName: "总件数", value: e.TotalItemCount),
                DataGridCell(columnName: "背托管者", value: e.Assignor),
                DataGridCell(columnName: "卖家", value: e.SellerId),
                DataGridCell(columnName: "重量", value: e.Weight),
                DataGridCell(columnName: "泡重", value: e.VolumetricWeight),
                DataGridCell(columnName: "快递费", value: e.PostFee),
                DataGridCell(columnName: "包装费", value: e.PackingFee),
              ]))
          .toList();
    }
  }

  //重写rows对象
  @override
  List<DataGridRow> get rows => billDetailsRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // var index = 0;
    var cells = row.getCells();
    var idCell = cells[0];
    var id = idCell.value == null ? '-' : idCell.value.toString();
    // var billId =
    var pidCell = cells[1];
    var pid = pidCell.value == null ? "" : pidCell.value.toString();
    var createTime = cells[2].value.toString();
    // print('创建时间是:');
    // print(createTime);
    var sendTime = cells[3].value.toString();
    var waybillCode = cells[4].value.toString();
    var itemKind = cells[5].value.toString();
    var totalCount = cells[6].value.toString();
    var assignor = cells[7].value.toString();
    var seller = cells[8].value.toString();
    var weight = cells[9].value == null ? "-" : cells[9].value.toString();
    var weight2 = cells[10].value == null ? "-" : cells[10].value.toString();
    var postFee = cells[11].value == null ? "-" : cells[11].value.toString();
    var packingFee = cells[12].value == null ? "-" : cells[12].value.toString();
    var rowColor = waybillCode.toLowerCase().startsWith(RegExp('[0-9]'))?Colors.white:Colors.black12;
    var highlightColor = const Color.fromARGB(89, 90, 120, 82);
    return DataGridRowAdapter(
        // cells: row.getCells().map<Widget>((dataGridCell) {
        //   return Container(
        //     // alignment: (dataGridCell.columnName == '编号' || dataGridCell.columnName == '包裹号')
        //     //     ? Alignment.centerLeft
        //     //     : Alignment.centerRight,
        //     decoration:new BoxDecoration(color:index++%2==1?Colors.red:Colors.green),
        //     alignment: Alignment.centerLeft,
        //     padding: EdgeInsets.all(5.0),
        //     child: Text(dataGridCell.value.toString()),
        //   );
        // }).toList());
        cells: [
          //编号
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0), child: Text(id),
            //不指定的话就是行的默认颜色
            // decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          //包裹号
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.cyan),
            child: Text(pid, style: const TextStyle(color: Colors.grey),),
          ),
          //创建时间
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.blue),
            child: Text(createTime, style: const TextStyle(color: Colors.grey),),
          ),
          //发货时间
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.amber),
            child: Text(sendTime),
          ),
          //快递单号
          Container(
            //这样设置不起作用
            // width: 300,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.lightGreen),
            child: Text(waybillCode),
          ),
          //商品种类
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            decoration: int.parse(itemKind)>5?BoxDecoration(color: highlightColor) :null,
            child: Text(itemKind),
          ),
          //总件数
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            decoration: int.parse(totalCount)>10?BoxDecoration(color: highlightColor) :null,
            child: Text(totalCount),
          ),
          //被托管者
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
            child: Text(assignor),
          ),
          //卖家
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
            child: Text(seller),
          ),
          //重量
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            decoration: weight != '-' && int.parse(weight)>5? BoxDecoration(color:  highlightColor) : null,
            child: Text(weight),
          ),
          //泡重
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            decoration: weight != '-' && int.parse(weight2)>5? BoxDecoration(color: highlightColor) : null,
            child: Text(weight2),
          ),
          //快递费
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            // decoration: const BoxDecoration(color: Colors.lightGreen),
            child: Text(postFee),
          ),
          //包装费
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10), child: Text(packingFee),
            // decoration: BoxDecoration(color: Colors.indigo),
          ),
        ],
        //默认行颜色
        // color: Colors.red
      //条件行颜色
      color:rowColor
    );
  }
}
//因为FutureBuilder属于Promise/Task,需要再网络异步返回以后才能获取到snapshot对象,所以调用一定要在FutureBuilder的回调中.
getDataGridRows(futureBuilderSnapshot)
{
  var ds = BillDetailsDataSource();
  if (futureBuilderSnapshot.hasData && futureBuilderSnapshot.data != null) {
    ds = BillDetailsDataSource(billDetails: futureBuilderSnapshot.data?.Details);
  }
  return ds;
}
//endregion

//region 动态构建组件
class _BillDetailListState extends State<BillDetailList> {
  @override
  Widget build(BuildContext context) {
    var req = WareHouseTakeOverBillDetailsGetRequest(PageNum: 1)
      ..StartSendTime = DateTime(2022, 4, 1)
      ..EndSendTime = DateTime(2022, 10, 1)
      ..TakeoverWhoUserId = 100002
      ..PageSize = 40;
    var session = context.read<AccountModel>().session;
    // print('你的session');
    // print(session);
    var rsp = sdkClient.execute(request: req, session:session);

    return Padding(
        padding: const EdgeInsets.all(10),
        // padding: EdgeInsetsGeometry.infinity,
        child:
          FutureBuilder<WareHouseTakeOverBillDetailsGetResponse>(
            future: rsp,
            builder: (context, snapshot) {
              //列数据
              var billDetailsColumns = getDataGridColumns();
              //行数据
              var billDetailsRows = getDataGridRows(snapshot);
              return SfDataGrid(
                  // rowHeight: 40,
                  columnWidthMode: ColumnWidthMode.none,
                  source: billDetailsRows,
                  columns: billDetailsColumns);
            },
          ),
    );
  }
}
//endregion