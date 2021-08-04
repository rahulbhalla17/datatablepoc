import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';
import 'package:datatablewebpoc/service/networking.dart';
import 'package:datatablewebpoc/Api/report_api.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key}) : super(key: key);

  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              top: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              bottom:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              left:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)))),
      child: DataTable(columns: getColumns(columns), rows: getRows(reports)),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: WidgetsStyles.textLato400Normal(
                  color: ColorResource.orangeText),
            ),
            //  onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Report> reports) => reports.map((Report report) {
        print('CenterName:$report.centerName');
        final cells = [
          report.centerName,
          report.date,
          report.calculated,
          report.adjustment,
          report.net,
          report.notes,
          report.paymentType,
          report.status
        ];
        print(cells[4]);
        return DataRow(
            // color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            //   if cells[4]
            //     return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            //   return null;  // Use the default value.
            // }),
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(Text(
            '$data',
            style:
                WidgetsStyles.textLato400Normal(color: ColorResource.greenText),
          )))
      .toList();
}
