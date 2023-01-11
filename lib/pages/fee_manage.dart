import 'package:flutter/material.dart';

import '../common/container_with_floating_draggable_btn.dart';
import '../components/bill_detail_list.dart';
import '../components/home/search_area.dart';

///托管账单页,默认进入应用后展示这个页面.

final ButtonStyle headerBtnStyle = ElevatedButton.styleFrom(
  // ignore: deprecated_member_use
  primary: Colors.lightGreen,
  // ignore: deprecated_member_use
  onPrimary: Colors.white,
);

class FeeManage extends StatefulWidget {
  const FeeManage({Key? key}) : super(key: key);

  @override
  State<FeeManage> createState() => _FeeManageState();
}

class _FeeManageState extends State<FeeManage> {
  Drawer drawer = Drawer(
    // backgroundColor: Colors.red,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('筛选条件'),
      ),
      body: SearchArea(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: BillDetailList(),
        // onClickOpenDrawerBtn: () {
        //   setState(() {
        //     showDrawer = !showDrawer;
        //   });
        // },
      ),
    );
  }
}
