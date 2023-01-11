import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';

import '../components/excel_previewer/sheet_previewer_v2.dart';

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
  // final String filePath = file.path;

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
  if (firstSheet != null) {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => SheetPreviewerV2(
        sheet: firstSheet,
      ),
    );
  } else {
    print('第一张表是空的???');
  }
}