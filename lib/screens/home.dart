import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/widget/search_widget.dart';
import 'package:datatablewebpoc/widget/dropdown_widget.dart';
import 'package:datatablewebpoc/widget/calendar_widget.dart';

//import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'dart:html';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Report> reports;
  //late List<Report> reportsFiltered = [];
  String _searchResult = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.reports = List.of(allReports);
    print('search book called1 : $reports');
    //reportsFiltered = reports;

  }

  @override
  Widget build(BuildContext context) {
    print('Search $_searchResult');
    print('Reports $reports');


    final columns = ['Center Name', 'Date', 'Calculated', 'Adjustment', 'Net', 'Notes', 'Payment Type', 'Status'];
    return SingleChildScrollView(
      child: Column(
        children: [
          buildSearch(),
         DropDownWidget(),
          //CalenderWidget(),
          Container(
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
          ),
        ],
      ),
    );

  }

  Widget buildSearch() => SearchWidget(
    text: _searchResult,
    hintText: 'Title or Author Name',
    onChanged: searchBook,
  );



  void searchBook(String _searchResult) {
    print('search book called');
    final reports = allReports.where((report) {

      final titleLower = report.centerName.toLowerCase();
      final authorLower = report.status.toLowerCase();
      final searchLower = _searchResult.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();


    setState(() {
      print('search book called1:$reports');
      this._searchResult = _searchResult;
      this.reports = reports;
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    label: Text(column),
  //  onSort: onSort,
  ))
      .toList();

  List<DataRow> getRows(List<Report> reports) => reports.map((Report report) {
    final cells = [report.centerName, report.date, report.calculated, report.adjustment, report.net, report.notes,report.paymentType,report.status ];
    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

}

