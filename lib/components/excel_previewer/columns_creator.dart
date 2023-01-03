//region 定义列头
//列的信息根据是否需要动态修改选择定义位置.如果在dart文件下直接定义而不是在 Widget build 方法中,则不会每次修改代码直接刷新.
//也可以跟row信息一样在异步数据返回后调用获取列信息.没有发现影响性能.
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

getDataGridColumns(Sheet sheet){
  var dataGridColumns = <GridColumn>[];
  var maxCols = sheet.maxCols;
  var maxRows = sheet.maxRows;
  if(maxRows <1) {
    return dataGridColumns;
  }
  //第一行就是列头了.
  var firstRow = sheet.rows[0];

  for(var i=0;i<maxCols;i++)
    {
      var currentCell = firstRow[i];
      var currentCellValue = "-";
      if(currentCell!= null && currentCell.value != null)
        {
          currentCellValue = currentCell.value.toString();
        }
      dataGridColumns.add(
        GridColumn(
          columnName: currentCell.toString(),
          label:Container(
            decoration: const BoxDecoration(color: Colors.grey),
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Text(
                  currentCellValue,
                )),
        )
      );
    }
  return dataGridColumns;
}
// var billDetailsColumns = getDataGridColumns();
//endregion