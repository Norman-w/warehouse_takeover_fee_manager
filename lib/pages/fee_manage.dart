import 'package:flutter/material.dart';

import '../SDK/API/WarehouseTakeover/WarehouseTakeoverBillDetailsGetRequest.dart';
import '../components/container_with_floating_draggable_btn.dart';
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
  WareHouseTakeOverBillDetailsGetRequest request = WareHouseTakeOverBillDetailsGetRequest(PageNum: 0,PageSize: 10);

  @override
  Widget build(BuildContext context) {
    Drawer drawer = Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('筛选条件'),
        ),
        body: SearchArea(
          onClickedSearchBtn:
              (req)
          {
            setState(() {
              request = req;
            });
          },
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
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
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      body: ContainerWithFloatingDraggableBtn(
        drawer: drawer,
        child: BillDetailList(request:request),
      ),
    );
  }
}
