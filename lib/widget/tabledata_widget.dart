import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/utilities/constants.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key}) : super(key: key);

  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late List<Report> reports;

  final columns = ['Center Name', 'Date', 'Calculated', 'Adjustment', 'Net', 'Notes', 'Payment Type', 'Status'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.reports = List.of(allReports);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border(
              right:
              BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              top:
              BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              bottom:
              BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
              left: BorderSide(
                  width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)))),
      child: DataTable(
          columns: getColumns(columns),
          rows: getRows(reports)
      ),
    );


  }


  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    label: Text(column,style:WidgetsStyles.textLato400NormalOrangeColor(),),
    //  onSort: onSort,
  ))
      .toList();

  List<DataRow> getRows(List<Report> reports) => reports.map((Report report) {
    final cells = [report.centerName, report.date, report.calculated, report.adjustment, report.net, report.notes,report.paymentType,report.status ];
    print(cells[4]);
    return DataRow(
        cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data',  style: WidgetsStyles.textLato400NormalGreenColor(),))).toList();

}

