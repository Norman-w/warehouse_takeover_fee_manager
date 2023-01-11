import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import '../components/bill_detail_list.dart';

// ignore: depend_on_referenced_packages
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import '../components/excel_previewer/sheet_previewer_v2.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../common/container_with_floating_draggable_btn.dart';
import '../components/home/search_area.dart';

var tabBarItems = const [
  TabItem(icon: Icons.home, title: '托管账单查询'),
  TabItem(icon: Icons.map, title: '物流成本查询'),
  TabItem(icon: Icons.add, title: '上传物流成本'),
// TabItem(icon: Icons.message, title: 'Message'),
// TabItem(icon: Icons.people, title: 'Profile'),
];

getPage(int pageIndex) {
  switch (pageIndex) {
    case 0:
      return const BillDetailList();
    case 1:
      return const Text('第一页');
  }
  return Text('$pageIndex');
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  final ButtonStyle headerBtnStyle = ElevatedButton.styleFrom(
    // ignore: deprecated_member_use
    primary: Colors.lightGreen,
    // ignore: deprecated_member_use
    onPrimary: Colors.white,
  );
  Widget currentPage = getPage(0);

  //const ColorfulLoading();

  Drawer drawer = Drawer(
    backgroundColor: Colors.red,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('筛选条件'),
      ),
      body: SearchArea(),
    ),
  );
  // bool showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButton:
      // ClipOval(
      //   child: Container(
      //     color: Colors.red,
      //     width: 50,
      //     height: 50,
      //     child: Text('test'),
      //   ),
      // )
      //  ,
      appBar: AppBar(
        // flexibleSpace :Text('3333'),
        // leading: Text('leading'),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('仓储托管费用管理'),
            ButtonBar(
              children: [
                // SearchArea(),
                ElevatedButton(
                  style: headerBtnStyle,
                  child: const Text('计算费用'),
                  onPressed: () => Navigator.pushNamed(context, '/test2'),
                ),
                ElevatedButton(
                  style: headerBtnStyle,
                  child: const Text('上传到服务器'),
                  onPressed: () => Navigator.pushNamed(context, '/test2'),
                ),
                ElevatedButton(
                  style: headerBtnStyle,
                  child: const Text('打开搜索选项'),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                // ElevatedButton(
                //   style: headerBtnStyle,
                //   child: const Text('载入表格'),
                //   //这里注意 _openXlsFile 和 _openXlsFile(context) 不一样.前者是直接赋值指针,调用不起来.后者是在回调时调用回调.
                //   onPressed: () => _openXlsFile(context),
                // ),
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
        // actions: [
        //   Text('12'),Text('12'),Text('12'),Text('12'),
        // ],
      ),
      body: ContainerWithFloatingDraggableBtn(
        drawer: drawer,
        child: currentPage,
        // onClickOpenDrawerBtn: () {
        //   setState(() {
        //     showDrawer = !showDrawer;
        //   });
        // },
      ),
      bottomNavigationBar:
          //region 底部导航条定义
          ConvexAppBar(
        items: tabBarItems,
// onTap: (int i) => print('click index=$i'),
        onTap: (int i) {
          setState(() {
            currentPage = getPage(i);
          });
        },
      )
//endregion
      ,
    );
  }
}
