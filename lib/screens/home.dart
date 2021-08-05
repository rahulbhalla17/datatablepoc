import 'package:datatablewebpoc/model/report.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/data/reports.dart';
import 'package:datatablewebpoc/widget/search_widget.dart';
import 'package:datatablewebpoc/widget/dropdown_widget.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/widget/tabledata_widget.dart';
import 'package:datatablewebpoc/widget/calendar_widget.dart';

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
  }

  final GlobalKey<DataTableWidgetState> tableWidgetState =
      GlobalKey<DataTableWidgetState>();

  final GlobalKey<DropDownWidgetState> dropDownWidgetState =
      GlobalKey<DropDownWidgetState>();

  @override
  Widget build(BuildContext context) {
    var dropDownWidget = DropDownWidget(key: dropDownWidgetState);
    print('Search $_searchResult');
    print('Reports $reports');

    return Container(
        padding: EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reports",
                style: WidgetsStyles.textRoboto500Normal(),
              ),
              Container(
                padding: EdgeInsets.only(top: 32, bottom: 24),
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, right: 24),
                      child: buildSearch()),
                  Container(
                      padding: EdgeInsets.only(right: 24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 16,
                                child: Text("Status",
                                    style: WidgetsStyles.textLato400Normal(),
                                    textAlign: TextAlign.left)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                                width: 169,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black26, width: 1),
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      dropDownWidgetState.currentState
                                          ?.showMultiSelect(context);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    child: Row(children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 19),
                                          child: Text(
                                            "2 Items Selected",
                                            style:
                                                WidgetsStyles.textLato400Normal(
                                                    color:
                                                        ColorResource.black80,
                                                    size: 14),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 12),
                                          width: 18,
                                          height: 18,
                                          child: Icon(Icons.arrow_drop_down,
                                              color: ColorResource.black100)),
                                    ])))
                          ])),
                  Container(
                      padding: EdgeInsets.only(right: 24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 16,
                                child: Text("Transaction Date",
                                    style: WidgetsStyles.textLato400Normal(
                                        color: ColorResource.primary100),
                                    textAlign: TextAlign.left)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                                width: 261,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: ColorResource.primary100,
                                      width: 1),
                                ),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      final initialDate = DateTime.now();
                                      final newDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(DateTime.now().year - 5),
                                        lastDate: DateTime(DateTime.now().year + 5),
                                      );

                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    child: Row(children: [
                                      Container(
                                          width: 18,
                                          height: 18,
                                          child: Icon(
                                              Icons.calendar_today_rounded,
                                              color: ColorResource.black100)),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                          child: Text(
                                        "Jun 16, 2021 - Jun 17, 2021",
                                        style: WidgetsStyles.textLato400Normal(
                                            color: ColorResource.black80,
                                            size: 14),
                                      )),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                          child: Icon(Icons.arrow_drop_down,
                                              color: ColorResource.black100)),
                                    ])))
                          ])),
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 272),
                      child: Column(children: [
                        Container(
                            width: 133,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  tableWidgetState.currentState
                                      ?.downloadTableData();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      width: 1,
                                      color: ColorResource.primary100),
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: Row(children: [
                                  Icon(Icons.download,
                                      color: ColorResource.primary100),
                                  Text("Download",
                                      style: WidgetsStyles.textLato700Normal(
                                          color: ColorResource.primary100,
                                          size: 14))
                                ])))
                      ])),
                ]),
              ),
              DataTableWidget(key: tableWidgetState),
            ],
          ),
        ));
  }

  Widget buildSearch() => SearchWidget(
        text: _searchResult,
        hintText: 'Search Center',
        onChanged: searchCenter,
      );



  void searchCenter(String _searchResult) {
    print('Search Result:$_searchResult');

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
