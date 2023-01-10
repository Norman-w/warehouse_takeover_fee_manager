import 'package:flutter/material.dart';
import '../../utils/widget.dart';

class DraggableHomeBtn extends StatefulWidget {
  ///可以拖动的home按钮,要指定父元素的绘制区域以免拖出边界
  DraggableHomeBtn({Key? key,
  required this.parentContext,
    required this.onClickOpenDrawerBtn,
    // required this.parentRect
  }
      ) : super(key: key);

  // Rect? parentRect;
  BuildContext parentContext;
  final VoidCallback onClickOpenDrawerBtn;
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
    var ref = Draggable(
      // rootOverlay: true,
      onDragEnd: (e) {
        dragEndInfo = e;
        // print('结束');
        // print(e.offset.dx);
        double topFixed = 0;
        double leftFixed = 0;
        if(dragEndInfo != null && dragStartInfo!= null)
          {
            //可拖拽的这个小按钮的矩形
            var draggableHomeRect = dragStartInfo!;
            //拖动的目标点信息
            var draggableDestHomeInfo = dragEndInfo!.offset;
            //小按钮的可活动区域的信息
            Rect parentRect = widget.parentContext.globalPaintBounds??Rect.zero;
            //最终要去向的纵向坐标(以小按钮的左上角为原点计算)
            topFixed = draggableDestHomeInfo.dy - draggableHomeRect.height;
            //最终要去向的横向坐标(以小按钮的左上角为原点计算)
            leftFixed = draggableDestHomeInfo.dx;
            //如果拖动到太低的地方了,让他就在底下待着别出界,这个逻辑也可以后续加到update里面来做.
            if(topFixed + draggableHomeRect.height > parentRect.height)
              {
                topFixed = parentRect.height - draggableHomeRect.height;
              }
            //如果太靠上或者太靠左了,不让他动了
            if(leftFixed + draggableHomeRect.width > parentRect.width)
              {
                leftFixed = parentRect.width - draggableHomeRect.width;
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
          }
        setState(() {
          top = topFixed;
          left = leftFixed;
        });
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