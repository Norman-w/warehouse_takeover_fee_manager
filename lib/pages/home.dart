import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import '../components/bill_detail_list.dart';
// ignore: depend_on_referenced_packages
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import '../components/excel_previewer/sheet_previewer_v2.dart';




class Home extends StatelessWidget {

  Future<void> _openXlsFile(BuildContext context) async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['xls', 'xlsx'],
    );
    final XFile? file = await FileSelectorPlatform.instance
        .openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    if (file == null) {
      // Operation was canceled by the user.
      return;
    }
    // final String fileName = file.name;
    //带文件名和扩展名的完整路径
    final String filePath = file.path;

    //调试,显示你打开的文件是什么.
    // await showDialog<void>(
    //   context: context,
    //   builder: (BuildContext context) => TextDisplay(fileName, filePath),
    // );
    // var bytes = File(filePath).readAsBytesSync();
    var bytes = await file.readAsBytes();
    var excel = Excel.decodeBytes(bytes);
    //
    // var rowIndex = 0;
    // for (var table in excel.tables.keys) {
    //   var sheet = excel.tables[table];
    //   if(sheet != null)
    //     {
    //       print(table); //sheet Name
    //       print(sheet.maxCols);
    //       print(sheet.maxRows);
    //       print('以下是当前sheet中的所有行内容:');
    //       for (var row in sheet.rows) {
    //         for (var cell in row) {
    //           print(cell?.value);
    //         }
    //         if(rowIndex++>=1) {
    //           break;
    //         }
    //       }
    //     }
    // }
    var firstSheetKey = excel.tables.keys.toList()[0];
    var firstSheet = excel.tables[firstSheetKey];
    if(firstSheet!= null)
    {
      await showDialog<void>(context: context, builder: (BuildContext context)=>
          SheetPreviewerV2(sheet: firstSheet,),
      );
    }
    else
    {
      print('第一张表是空的???');
    }
  }

  final ButtonStyle headerBtnStyle = ElevatedButton.styleFrom(
    // ignore: deprecated_member_use
    primary: Colors.lightGreen,
    // ignore: deprecated_member_use
    onPrimary: Colors.white,
  );

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('仓储托管费用管理'),
              ButtonBar(
                children: [
                  ElevatedButton(
                    style: headerBtnStyle,
                    child: const Text('试算'),
                    onPressed: () => Navigator.pushNamed(context, '/test2'),
                  ),
                  ElevatedButton(
                    style: headerBtnStyle,
                    child: const Text('载入表格'),
                    //这里注意 _openXlsFile 和 _openXlsFile(context) 不一样.前者是直接赋值指针,调用不起来.后者是在回调时调用回调.
                    onPressed: () => _openXlsFile(context),
                  ),
                  // ElevatedButton(
                  //   style: headerBtnStyle,
                  //   child: const Text('试算'),
                  //   onPressed: () => Navigator.pushNamed(context, '/test2'),
                  // ),
                  const SizedBox(width: 10,),
                ],
              ),
            ],),
        ),
        body: const Center(
          child:BillDetailList(),
        ),
      );
  }
}
