import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'cost_manage.dart';
import 'cost_upload.dart';
import 'fee_manage.dart';

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
      return const FeeManage();
    case 1:
      return const CostManage();
    case 2:
      return const CostUpload();
  }
  return Text('$pageIndex');
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget currentPage = getPage(0);

  //const ColorfulLoading();

  // bool showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar:
          //region 底部导航条定义
          ConvexAppBar(
            backgroundColor: Theme.of(context).primaryColor,
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
