import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_takeover_fee_manager/components/colorful_loading.dart';

import '../components/excel_previewer/sheet_previewer_v2.dart';

// ignore: depend_on_referenced_packages
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';

/**
 * 快递成本上传页
 */
final ButtonStyle headerBtnStyle = ElevatedButton.styleFrom(
  // ignore: deprecated_member_use
  primary: Colors.lightGreen,
  // ignore: deprecated_member_use
  onPrimary: Colors.white,
);


class CostUpload extends StatefulWidget {
  const CostUpload({Key? key}) : super(key: key);

  @override
  State<CostUpload> createState() => _CostUploadState();
}

class _CostUploadState extends State<CostUpload> {
  Sheet? showingSheet;
  Future<void> openXlsFile() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'Excel files',
      extensions: <String>['xls', 'xlsx'],
    );
    final XFile? file = await FileSelectorPlatform.instance
        .openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    if (file == null) {
      // Operation was canceled by the user.
      return;
    }
    var bytes = await file.readAsBytes();
    var excel = Excel.decodeBytes(bytes);
    var firstSheetKey = excel.tables.keys.toList()[0];
    var firstSheet = excel.tables[firstSheetKey];
    if (firstSheet != null) {
      setState(() {
        showingSheet = firstSheet;
      });
    } else {
      print('第一张表是空的???');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('物流成本上传'),
            ButtonBar(
              children: [
                ElevatedButton(
                  style: headerBtnStyle,
                  child: const Text('载入表格'),
                  //这里注意 _openXlsFile 和 _openXlsFile(context) 不一样.前者是直接赋值指针,调用不起来.后者是在回调时调用回调.
                  onPressed: () => openXlsFile(),
                ),
                // ElevatedButton(
                //   style: headerBtnStyle,
                //   child: const Text('试算'),
                //   onPressed: () => Navigator.pushNamed(context, '/test2'),
                // ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      body: showingSheet == null?
          const Center(
            // width: 800,height: 600,
            child: ColorfulLoading(texts: [
              "未载入快递公司账单","请点击右上角打开Excel文件"
            ],),):
      SheetPreviewerV2(sheet: showingSheet!,),
    );
  }
}
