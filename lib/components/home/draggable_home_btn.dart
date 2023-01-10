import 'package:flutter/material.dart';
import '../../utils/widget.dart';

///可拖动组件的位置信息.
class DraggableWidgetPosition
{
  DraggableWidgetPosition(Rect containerRect,
      Rect draggableWidgetRect,
      double draggableWidgetTop,
      double draggableWidgetLeft,
      )
  {
    nodeTop2ParentTopDistance = containerRect.top - draggableWidgetRect.top;
    nodeLeft2ParentLeftDistance = containerRect.left - draggableWidgetRect.left;
    nodeRight2ParentRightDistance = containerRect.right - draggableWidgetRect.right;
    nodeBottom2ParentBottomDistance = containerRect.bottom - draggableWidgetRect.bottom;
    //真正的右边 是在位置上加上宽度
    right = draggableWidgetLeft + draggableWidgetRect.right;
    top = draggableWidgetRect.top;
    bottom = draggableWidgetTop + draggableWidgetRect.bottom;
    left = draggableWidgetRect.left;
  }
  double nodeTop2ParentTopDistance = 0;
  double nodeLeft2ParentLeftDistance = 0;
  double nodeRight2ParentRightDistance = 0;
  double nodeBottom2ParentBottomDistance = 0;
  double right = 0;
  double left = 0;
  double top = 0;
  double bottom = 0;
}

///定义回调函数类型.
typedef OnDraggableButtonPosChange = void Function(DraggableWidgetPosition position, bool triggerByContainerResize);

class DraggableHomeBtn extends StatefulWidget {
  ///可以拖动的home按钮,要指定父元素的绘制区域以免拖出边界
  DraggableHomeBtn({
    Key? key,
    required this.parentContext,
    // required this.parentRect,
    required this.onClickOpenDrawerBtn,
    required this.onDraggableButtonPosChange,
    required this.newContainerSize,
  }) : super(key: key);

  Size? newContainerSize;

  final BuildContext parentContext;
  // final Rect? parentRect;
  final VoidCallback onClickOpenDrawerBtn;
  final OnDraggableButtonPosChange onDraggableButtonPosChange;

  @override
  State<DraggableHomeBtn> createState() => _DraggableHomeBtnState();
}

class _DraggableHomeBtnState extends State<DraggableHomeBtn> {
  Rect? dragStartInfo;
  DraggableDetails? dragEndInfo;
  double top = 0;
  double left = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // print('重新绘制,新尺寸?');
    // print(widget.newContainerSize);
    updatePosition(bool triggerByContainerReSize)
    {
      double topFixed = 0;
      double leftFixed = 0;

      if(
      // widget.parentRect != null &&
      dragEndInfo != null && dragStartInfo!= null)
      {
        //可拖拽的这个小按钮的矩形
        var draggableHomeBtnRect = dragStartInfo!;
        //拖动的目标点信息
        var draggableDestHomeInfo = dragEndInfo!.offset;
        //小按钮的可活动区域的信息
        // Rect parentRect = widget.parentRect!;
        Rect parentRect = widget.parentContext.globalPaintBounds??Rect.zero;
        if(widget.newContainerSize!= null)
          {
            parentRect = Rect.fromLTWH(parentRect.left, parentRect.top, widget.newContainerSize!.width, widget.newContainerSize!.height);
          }

        //最终要去向的纵向坐标(以小按钮的左上角为原点计算)
        topFixed = draggableDestHomeInfo.dy - draggableHomeBtnRect.height;
        //最终要去向的横向坐标(以小按钮的左上角为原点计算)
        leftFixed = draggableDestHomeInfo.dx;
        //如果拖动到太低的地方了,让他就在底下待着别出界,这个逻辑也可以后续加到update里面来做.
        if(topFixed + draggableHomeBtnRect.height > parentRect.height)
        {
          topFixed = parentRect.height - draggableHomeBtnRect.height;
        }
        //如果太靠上或者太靠左了,不让他动了
        if(leftFixed + draggableHomeBtnRect.width > parentRect.width)
        {
          leftFixed = parentRect.width - draggableHomeBtnRect.width;
        }
        //如果超出左边或者超过上面,不让动.
        if(leftFixed<0)
        {
          leftFixed = 0;
        }
        if(topFixed<0)
        {
          topFixed = 0;
        }
        widget.onDraggableButtonPosChange(DraggableWidgetPosition(
            parentRect,
            draggableHomeBtnRect,
          topFixed,
          leftFixed
        ),widget.newContainerSize!= null);
      }
      setState(() {
        top = topFixed;
        left = leftFixed;
      });
    }
    if(widget.newContainerSize != null)
    {
      updatePosition(false);
      widget.newContainerSize = null;
      print('尺寸变更的时候触发的');
      //下面这句不能加...否则直接return了以后就啥也看不到了.
      // return const SizedBox.shrink();
    }
    var ref = Draggable(
      onDragEnd: (e) {
        dragEndInfo = e;
        updatePosition(false);
      },
      onDragStarted: () {
        //只在做开始的时候记录一下这个拖动的小按钮是多大的地方就可以了.
        if(dragStartInfo!= null) {
          return;
        }
        dragStartInfo = context.globalPaintBounds;
        // print(context.owner);
        // print('开始');
        // print(dragStartInfo);
      },
      onDragUpdate: (e) {
        // print(e.globalPosition.dy);
      },
      childWhenDragging: const SizedBox.shrink(),
      feedback: FloatingActionButton(
        onPressed: () {},
        child: const Text('放哪?'),
      ),
      child: FloatingActionButton(
        onPressed: () {
          widget.onClickOpenDrawerBtn();
        },
        child: const Text('筛选'),
      ),
    );
    return Positioned(
      top: top,
      left: left,
      child: ref,
    );
  }
}