import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'columns_creator.dart';
import 'rows_creator.dart';

//组件声明 支持选择选区的
class SheetPreviewerV2 extends StatefulWidget {
  final Sheet sheet;
  //选区的起点
  int? startColIndex;

  int? startRowIndex;

  //选区的终点
  int? endColIndex;

  int? endRowIndex;

  SheetPreviewerV2({Key? key, required this.sheet}) : super(key: key);

  @override
  State<SheetPreviewerV2> createState() => _SheetPreviewerV2State();
}

class _SheetPreviewerV2State extends State<SheetPreviewerV2> {
  //当格子两下被点击的时候.计算开始和结束格子,然后让他们高亮显示.
  onCellDoubleTap(details){
    if(widget.startColIndex != null && widget.endColIndex != null)
      {
        // 清空.
        widget.startColIndex = null;widget.startRowIndex = null;widget.endColIndex = null;widget.endRowIndex = null;
      }
    if(widget.startColIndex == null)
    {
      widget.startColIndex = details.rowColumnIndex.columnIndex;
      widget.startRowIndex = details.rowColumnIndex.rowIndex;
    }
    else if(widget.endColIndex == null)
    {
      widget.endColIndex = details.rowColumnIndex.columnIndex;
      widget.endRowIndex = details.rowColumnIndex.rowIndex;
      //两个都赋值完成,计算
      int leftColIndex = widget.startColIndex!>widget.endColIndex!? widget.endColIndex!:widget.startColIndex!;
      int rightColIndex = widget.startColIndex!>widget.endColIndex!? widget.startColIndex!:widget.endColIndex!;
      int topRowIndex = widget.startRowIndex!>widget.endRowIndex!? widget.endRowIndex!:widget.startRowIndex!;
      int bottomRowIndex = widget.startRowIndex!>widget.endRowIndex!? widget.startRowIndex!:widget.endRowIndex!;



      //显示所有的已经选择的区域
      setState(() {
        widget.startColIndex = leftColIndex;
        widget.endColIndex = rightColIndex;
        widget.startRowIndex = topRowIndex;
        widget.endRowIndex = bottomRowIndex;
      });


      // print('左');
      // print(widget.startColIndex);
      // print('右');
      // print(widget.endColIndex);
      // print('上');
      // print(widget.startRowIndex);
      // print('下');
      // print(widget.endRowIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: const Text('文件预览'),
      ),
      body:Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      // padding: EdgeInsetsGeometry.infinity,
      child:SfDataGrid(
              onCellDoubleTap: onCellDoubleTap,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              columnWidthMode: ColumnWidthMode.fill,
              // source: getDataGridRows(sheet),
              source: getDataGridRowsWithHighlight(widget.sheet,
                  widget.startColIndex,
                  widget.endColIndex,
                  widget.startRowIndex,
                  widget.endRowIndex),
              columns: getDataGridColumns(widget.sheet)),
      )
    );
  }
}




//endregion
