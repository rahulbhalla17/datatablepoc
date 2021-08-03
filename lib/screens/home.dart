import 'package:datatablewebpoc/model/report.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/widget/search_widget.dart';
import 'package:datatablewebpoc/widget/dropdown_widget.dart';
import 'package:datatablewebpoc/widget/calendar_widget.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/widget/tabledata_widget.dart';

//import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
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
    // TODO: implement initState
    super.initState();

    this.reports = List.of(allReports);
    print('search book called1 : $reports');

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
          DataTableWidget(),

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



}

