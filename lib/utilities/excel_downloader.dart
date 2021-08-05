import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'dart:io';

class ExcelDownloader {
  void writeToExcelSheet(
      {String? fileName, List<String>? tableHeaders, List<Report>? data}) {
    Excel excel = Excel.createExcel();
    Sheet sheet = excel["Sheet1"];

    CellStyle cellStyle = CellStyle(
      bold: true,
    );

    if (tableHeaders != null) {
      sheet.appendRow(tableHeaders);
    }

    if (data != null) {
      for (Report value in data) {
        sheet.appendRow(value.toValuesArray());
      }
    }

    for (var table in excel.tables.keys) {
      var maxCols = excel.tables[table]!.maxCols;
      var maxRows = excel.tables[table]!.maxRows;
      print("Columns $maxCols");
      print("Rows $maxRows");
    }

    var finalName = fileName! + ".xlsx";
    excel.rename("Sheet1", "Report");
    var fileBytes = excel.save(fileName: finalName);
  }
}
