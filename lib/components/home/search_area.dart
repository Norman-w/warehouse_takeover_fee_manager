/// 搜索托管账单用的搜索条

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:warehouse_takeover_fee_manager/SDK/API/WarehouseTakeover/WarehouseTakeoverBillDetailsGetRequest.dart';


import '../../utils/time.dart';

typedef OnClickedSearchBtnCallback = Function(WareHouseTakeOverBillDetailsGetRequest req);

class SearchArea extends StatefulWidget {
  final OnClickedSearchBtnCallback? onClickedSearchBtn;
  const SearchArea({super.key,this.onClickedSearchBtn});
  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  //region 输入的内容,用来查询的
  //包裹号
  int? pid;
  //快递单号
  String? waybillCode;
  //发货时间开始
  DateTime? sendStartTime;
  //发货时间结束
  DateTime? sendEndTime;
  //种类大于多少的
  int? minKindCount;
  //是否只获取包装费大于1的
  bool onlyFeeMoreThan1 = false;
  //邮费大于多少的
  double? minPostFee;
  //只查看没有快递信息的
  bool onlyNoWaybillCode = false;
  //endregion

  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    var text = sendEndTime == null? "" :sendEndTime.toString();
    _controller.addListener(() {

    });
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
      TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   width: 200,height: 20,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.deepPurple,
        //     ),
        //   ),
        // ),
        SizedBox(
          // decoration: BoxDecoration(color: Colors.red),
          // width: 150,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (e) {
                // print(e);
                setState(() {
                  pid = int.tryParse(e);
                });
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp('[0-9]')),
              ],
              maxLength: 10,
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                //通过设置counterText为空加上TextField的MaxLength属性可以只限制TextField的输入长度但不显示3/32这样的文字提示
                counterText: "",
                labelText: '包裹号',
                labelStyle: TextStyle(color: Colors.lightBlue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        //回显看一下当前的输入内容
        // Text(
        //   '$pid',
        // ),
        SizedBox(
          // decoration: BoxDecoration(color: Colors.red),
          // width: 250,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (e) {
                // print(e);
                setState(() {
                  waybillCode =e;
                });
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp('[0-9 a-z A-Z]')),
              ],
              maxLength: 20,
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: "",
                labelText: '快递单号',
                labelStyle: TextStyle(color: Colors.lightBlue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        SizedBox(
          // decoration: BoxDecoration(color: Colors.red),
          // width: 100,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (e) {
                // print(e);
                setState(() {
                  pid = int.tryParse(e);
                });
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp('[0-9]')),
              ],
              maxLength: 3,
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: "",
                labelText: '>多少种',
                labelStyle: TextStyle(color: Colors.lightBlue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        // Padding(padding: EdgeInsets.all(10),
        //   child:
          Row(
          mainAxisAlignment : MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                // width: 100,
                height: 63,
                // decoration: BoxDecoration(border: Border.all(color:Colors.red,width:1)),
                // padding: EdgeInsets.all(10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("只看包装费>1",
                      style: TextStyle(fontSize: 12),
                    ),
                    Switch(
                      // activeColor: Colors.lightGreenAccent,
                      // inactiveThumbColor: Colors.grey,
                      value:onlyFeeMoreThan1, onChanged: (bool value) {
                      setState(() {
                        onlyFeeMoreThan1 = value;
                      });
                    },),
                  ],
                ),
              ),
              SizedBox(
                // width: 100,
                height: 63,
                // decoration: BoxDecoration(border: Border.all(color:Colors.red,width:1)),
                // padding: EdgeInsets.all(10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("只看无快递信息",
                      style: TextStyle(fontSize: 12),
                    ),
                    Switch(
                      // activeColor: Colors.lightGreenAccent,
                      // inactiveThumbColor: Colors.grey,
                      value:onlyNoWaybillCode, onChanged: (bool value) {
                      setState(() {
                        onlyNoWaybillCode = value;
                      });
                    },),
                  ],
                ),
              ),
            ],
          ),
        // ),



        SizedBox(
          // decoration: BoxDecoration(color: Colors.red),
          // width: 130,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (e) {
                // print(e);
                setState(() {
                  pid = int.tryParse(e);
                });
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp('[0-9 .]')),
              ],
              maxLength: 5,
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: "",
                labelText: '>多少邮费',
                labelStyle: TextStyle(color: Colors.lightBlue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        SizedBox(
          // decoration: BoxDecoration(color: Colors.red),
          // width: 130,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              onTap: ()async{
                // print('点击了');
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('发货起止时间选择'),
                    // On web the filePath is a blob url
                    // while on other platforms it is a system path.
                    content:
                        SizedBox(
                          width: 600,
                            height: 400,
                          child: SfDateRangePicker(
                            onSelectionChanged: (e){
                              //e.value才是值
                              // print(e.value);
                            },
                            onCancel: (){
                              Navigator.pop(context);
                            },
                            onSubmit: (e){
                              //直接就是值
                              // print(e);
                              // var range = PickerDateRange(DateTime(1970,1,1,0,0,0), DateTime(1970,1,1,0,0,0));
                              var range = e as PickerDateRange;
                              sendEndTime = range.endDate;
                              sendStartTime = range.startDate;
                              // print(range.startDate);
                              // print(range.endDate);
                              _controller.text = '${timeToCNDay(range.endDate)}-${timeToCNDay(range.startDate)}';
                              Navigator.pop(context);
                              // setState(() {
                              // });
                            },
                            confirmText: '确认',
                            cancelText: '取消',
                            showActionButtons: true,
                            selectionMode : DateRangePickerSelectionMode.range,
                            view: DateRangePickerView.month,
                          ),
                        )
                    ,
                    // actions: <Widget>[
                    //   TextButton(
                    //     child: const Text('关闭'),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ],
                  ),
                );
              },
              onChanged: (e) {
                // print(e);
                setState(() {
                  pid = int.tryParse(e);
                });
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp('[0-9 .]')),
              ],
              readOnly: true,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                // suffixIcon: Text('ddd'),
                counterText: "",
                labelText: '发货起止时间',
                labelStyle: TextStyle(color: Colors.lightBlue),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        //查询按钮
        ElevatedButton(
          child: const Text('查询'),
          onPressed: () {
            if(widget.onClickedSearchBtn!=null)
              {
                var req = WareHouseTakeOverBillDetailsGetRequest(
                    PageNum: 0,
                    PageSize: 100,
                  Pid: pid,
                  WaybillCode: waybillCode,
                  StartSendTime: sendStartTime,
                  EndSendTime: sendEndTime,
                );

                widget.onClickedSearchBtn!(req);
              }
          },
        ),
      ],
    );
  }
}
