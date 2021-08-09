import 'package:datatablewebpoc/model/report.dart';
import 'package:datatablewebpoc/utilities/excel_downloader.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';
import 'package:datatablewebpoc/Api/report_api.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key}) : super(key: key);
  @override
  DataTableWidgetState createState() => DataTableWidgetState();
}

class DataTableWidgetState extends State<DataTableWidget> {
  late List<Report> reports = [];

  final columns = [
    'Center Name',
    'Date',
    'Calculated',
    'Adjustment',
    'Net',
    'Notes',
    'Payment Type',
    'Status'
  ];

  @override
  void initState() {
    super.initState();
    getReportData();
  }

  void downloadTableData() {
    ExcelDownloader().writeToExcelSheet(
        fileName: "Report", tableHeaders: columns, data: reports);
  }

  Future<void> getReportData() async {
    List<Report> items = [];
    var productData = await ReportData().getReportData();
    print('test:$productData');
    for (Map<String, dynamic> value in productData) {
      print('testt:$value');
      Report item = Report.fromJson(value);
      items.add(item);
    }
    setState(() {
      if (reports.isNotEmpty) {
        reports.removeRange(0, reports.length);
      }
      reports.addAll(items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border(
                      right: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
                      top: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
                      bottom: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
                      left: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)))),
              child: DataTable(
                  columns: getColumns(columns), rows: getRows(reports)),
            )));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: WidgetsStyles.textLato700Normal(
                  size: 12, color: ColorResource.black80),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Report> reports) => reports.map((Report report) {
        print('CenterName:$report.centerName');
        return DataRow(cells: getCells(report.toDisplayValuesArray()));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) {
    List<DataCell> dataCells = [];

    cells.asMap().forEach((index, data) {
      if (index == 0) {
        DataCell dataCell = new DataCell(Row(children: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFEFDD),
                  borderRadius: BorderRadius.circular(12)),
              width: 36,
              height: 36,
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: data.substring(0, 2),
                    style: WidgetsStyles.textLato700Normal(
                        size: 16,
                        color: Color(0xff8E5A1E),
                        backgroundColor: Color(0xffFFEFDD)))
              ]))),
          Text(data.substring(2, data.length),
              style: WidgetsStyles.textLato400Normal(
                  size: 14, color: ColorResource.black100))
        ]));
        dataCells.add(dataCell);
      } else if (index == 7) {
        DataCell dataCell = new DataCell(Row(children: [
          Container(
              decoration: BoxDecoration(
                  //color: Color(0xffFFEFDD),
                  borderRadius: BorderRadius.circular(4)),
              height: 24,
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: data,
                    style: WidgetsStyles.textLato400Normal(
                        size: 12,
                        color: data == 'Settled'
                            ? Color(0xff00B28A)
                            : Color(0xffDF9641),
                        backgroundColor: data == 'Settled'
                            ? Color(0xffEBF9F6)
                            : Color(0xffFDF7F0)))
              ]))),
        ]));
        dataCells.add(dataCell);
      } else {
        DataCell cell = DataCell(Text(
          '$data',
          style: WidgetsStyles.textLato400Normal(
              size: 14,
              color: '$index' == '4'
                  ? ColorResource.greenText
                  : ColorResource.black100),
        ));
        dataCells.add(cell);
      }
    });
    return dataCells;
  }
}
