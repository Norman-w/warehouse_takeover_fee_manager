import 'package:flutter/widgets.dart';

import 'draggable_home_btn.dart';

/**
 * 上面有头,下面有脚,这是中间的page content container
 * 单独抽离出来一个文件就是为了要获取到context 这样就可以通过context获取到中间可拖动的小按钮的可活动范围了.
 */

class ContentContainer extends StatefulWidget {
  const ContentContainer({
    Key? key,
    required this.currentPage,
    required this.showDrawer,
    required this.drawer,
    required this.onClickOpenDrawerBtn,
  }) : super(key: key);
  final Widget currentPage;
  final bool showDrawer;
  final Widget drawer;
  final VoidCallback onClickOpenDrawerBtn;

  @override
  State<ContentContainer> createState() => _ContentContainerState();
}

class _ContentContainerState extends State<ContentContainer> {
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          //当前显示的主要的页面
          widget.currentPage,
          //如果显示抽屉设置为true就显示,不然就显示一个空的占位符
          Align(
            alignment: Alignment.centerRight,
            child: widget.showDrawer?widget.drawer:const SizedBox.shrink(),
          ),
          DraggableHomeBtn(parentContext:context,onClickOpenDrawerBtn:widget.onClickOpenDrawerBtn),
        ],
      );
  }
}
