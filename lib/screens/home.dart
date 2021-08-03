import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/widget/search_widget.dart';
import 'package:datatablewebpoc/widget/dropdown_widget.dart';
import 'package:datatablewebpoc/widget/calendar_widget.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/widget/tabledata_widget.dart';

import 'dart:html';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Report> reports;
  String _searchResult = '';

  @override
  void initState() {
    super.initState();

    this.reports = List.of(allReports);
    print('search report called : $reports');
  }

  @override
  Widget build(BuildContext context) {
    print('Search $_searchResult');
    print('Reports $reports');

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
    return Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reports",
                style: WidgetsStyles.textRoboto500Normal(),
                textAlign: TextAlign.left),
            Container(
              padding: EdgeInsets.only(top: 32, bottom: 24),
              child: Row(children: [
                Container(
                    padding: EdgeInsets.only(top: 20, right: 24),
                    child: buildSearch()),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 16,
                          padding: EdgeInsets.only(left: 4, bottom: 4),
                          child: Text("Status",
                              style: WidgetsStyles.textLato400Normal(),
                              textAlign: TextAlign.left)),
                      Container(
                          width: 169,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          child: DropDownWidget())
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 16,
                          padding: EdgeInsets.only(left: 4, bottom: 4),
                          child: Text("Transaction Date",
                              style: WidgetsStyles.textLato400Normal(),
                              textAlign: TextAlign.left)),
                      Container(
                          width: 261,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          child: CalenderWidget())
                    ]),
                Column(children: [
                  Container(
                      width: 133,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(children: [
                            Icon(Icons.download),
                            Text("Download")
                          ])))
                ]),
              ]),
            ),
            DataTableWidget(),
          ],
        ));
  }

  Widget buildSearch() => SearchWidget(
        text: _searchResult,
        hintText: 'Search Center',
        onChanged: searchCenter,
      );

  void searchCenter(String _searchResult) {
    final reports = allReports.where((report) {
      final titleLower = report.centerName.toLowerCase();
      final authorLower = report.status.toLowerCase();
      final searchLower = _searchResult.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this._searchResult = _searchResult;
      this.reports = reports;
    });
  }
}
