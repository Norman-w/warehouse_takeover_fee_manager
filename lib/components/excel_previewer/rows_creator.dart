
//region 数据源处理 从返回的response.Details创建用于sfDataGrid显示的数据源
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BillDetailsDataSource extends DataGridSource {
  List<DataGridRow> rowsData = [];

  BillDetailsDataSource({required Sheet sheet}) {
    var maxCols = sheet.maxCols;
    var maxRows = sheet.maxRows;
    if(maxCols <1 || maxRows<1)
      {
        return;
      }
    rowsData = sheet.rows.getRange(1, sheet.rows.length).map((row){
      //每一行创建一个DataGridRow
      var dataGridRow = DataGridRow(
        cells: row.map((cell){
          var cellValue = "";
          if(cell!= null && cell.value!= null)
            {
              cellValue = cell.value.toString();
            }
          return DataGridCell(columnName: "", value:cellValue);
        }).toList(),
      );
      return dataGridRow;
    }).toList();
  }

  //重写rows对象
  @override
  List<DataGridRow> get rows => rowsData;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
          child: Text(e.value),
        )).toList(),
    );
  }
}
getDataGridRows(Sheet sheet)
{
  var ds = BillDetailsDataSource(sheet:sheet);
  return ds;
}


class BillDetailsWithHighlightDataSource extends DataGridSource {
  List<DataGridRow> rowsData = [];

  int? startCol; int? endCol; int? startRow; int? endRow;

  BillDetailsWithHighlightDataSource({required Sheet sheet, this.startCol, this.endCol, this.startRow, this.endRow}) {
    var maxCols = sheet.maxCols;
    var maxRows = sheet.maxRows;
    if(maxCols <1 || maxRows<1)
    {
      return;
    }
    rowsData = sheet.rows.getRange(1, sheet.rows.length).map((row){
      //每一行创建一个DataGridRow
      var dataGridRow = DataGridRow(
        cells: row.map((cell){
          var cellValue = "";
          if(cell!= null && cell.value!= null)
          {
            cellValue = cell.value.toString();
          }
          return DataGridCell(columnName: "", value:cellValue);
        }).toList(),
      );
      return dataGridRow;
    }).toList();
  }

  bool isHighlightCell(int rowIndex,int colIndex) {
    if (startCol == null || endCol == null || startRow == null ||
        endRow == null) {
      return false;
    }
    if (rowIndex >= startRow! && rowIndex <= endRow! && colIndex >= startCol! &&
        colIndex <= endCol!) {
      return true;
    }
    return false;
  }

  //重写rows对象
  @override
  List<DataGridRow> get rows => rowsData;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((e) => Container(
        decoration: isHighlightCell(rowsData.indexOf(row)
        //往后推一行,因为第一行实际上是列头
            +1
            ,row.getCells().indexOf(e))?
            const BoxDecoration(color: Colors.lightGreenAccent):null
        ,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0),
        child: Text(e.value),
      )).toList(),
    );
  }
}
getDataGridRowsWithHighlight(Sheet sheet, int? startCol, int? endCol, int? startRow, int? endRow)
{
  print('获取数据的时候');
  print(startCol);
  print(endCol);
  print(startRow);
  print(endRow);
  return BillDetailsWithHighlightDataSource(sheet:sheet,startCol:startCol, endCol:endCol, startRow:startRow, endRow:endRow);
}
//endregion
