import 'package:flutter/widgets.dart';
import 'draggable_home_btn.dart';
import '../../utils/size_listener.dart';

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
  //可拖动组件的位置
  DraggableWidgetPosition? draggableWidgetPosition;

  Size? newContainerSize;

  @override
  Widget build(BuildContext context) {
    // print('构建组件,大小是:');
    // print(context.globalPaintBounds);
    // var rect = context.globalPaintBounds;
    return
      SizeListener(
        child:Stack(
          children: [
            //当前显示的主要的页面
            widget.currentPage,
            //如果显示抽屉设置为true就显示,不然就显示一个空的占位符
            Align(
              alignment: Alignment.centerRight,
              child: widget.showDrawer ? widget.drawer : const SizedBox
                  .shrink(),
            ),
            DraggableHomeBtn(
              newContainerSize: newContainerSize,
              // parentRect: context.globalPaintBounds,
              parentContext: context,
              onClickOpenDrawerBtn: widget.onClickOpenDrawerBtn,
              onDraggableButtonPosChange: (pos, triggerByContainerResize) {
                print('拖动标志的位置变化了');
                print(draggableWidgetPosition);
                // setState(() {
                draggableWidgetPosition = pos;
                // });
                if(triggerByContainerResize)
                  {
                    newContainerSize = null;
                  }
              },
            ),
          ],
        ),
         onWidgetSizeChange: (size) {
              if (
              //超出了右边区域
              (draggableWidgetPosition != null &&
                  draggableWidgetPosition!.right > size.width)
                  //超出了下边区域
                  ||
                  (draggableWidgetPosition != null &&
                      draggableWidgetPosition!.bottom > size.height)) {
                setState(() {
                  newContainerSize = size;
                });
              }
            },
      );
  }
}
