import 'package:datatablewebpoc/model/report.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';
import 'package:flutter/material.dart';
import 'package:datatablewebpoc/widget/search_widget.dart';
import 'package:datatablewebpoc/widget/dropdown_widget.dart';
import 'package:datatablewebpoc/utilities/constants.dart';
import 'package:datatablewebpoc/widget/tabledata_widget.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:datatablewebpoc/screens/netInfo_screen.dart';

class RoyaltyReport extends StatefulWidget {
  const RoyaltyReport({Key? key}) : super(key: key);

  @override
  _RoyaltyReportState createState() => _RoyaltyReportState();
}

class _RoyaltyReportState extends State<RoyaltyReport> {
  String _searchResult = '';

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
  }

  final GlobalKey<DataTableWidgetState> tableWidgetState =
      GlobalKey<DataTableWidgetState>();

  @override
  Widget build(BuildContext context) {
    print('Search $_searchResult');

    return Scaffold(
        appBar: AppBar(
          title: Text("Royalty Report"),
        ),
        body: Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.white, // needs to change it to white color
            child: SafeArea(
                child: Container(
                    padding: EdgeInsets.all(40.0),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Reports",
                            style: WidgetsStyles.textRoboto500Normal(),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 32, bottom: 24),


                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,

                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                          padding:
                                              EdgeInsets.only(top: 20, right: 24),
                                          child: buildSearch()),
                                      Container(
                                          padding: EdgeInsets.only(right: 24),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 16,
                                                    child: Text("Status",
                                                        style: WidgetsStyles
                                                            .textLato400Normal(),
                                                        textAlign:
                                                            TextAlign.left)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                    width: 169,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.black26,
                                                          width: 1),
                                                    ),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          showDropDown();
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .white)),
                                                        child: Row(children: [
                                                          Container(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 19),
                                                              child: Text(
                                                                "2 Items Selected",
                                                                style: WidgetsStyles
                                                                    .textLato400Normal(
                                                                        color: ColorResource
                                                                            .black80,
                                                                        size: 14),
                                                              )),
                                                          Container(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 12),
                                                              width: 18,
                                                              height: 18,
                                                              child: Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: ColorResource
                                                                      .black100)),
                                                        ])))
                                              ])),
                                      Container(
                                          padding: EdgeInsets.only(right: 24),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 16,
                                                    child: Text(
                                                        "Transaction Date",
                                                        style: WidgetsStyles
                                                            .textLato400Normal(
                                                                color: ColorResource
                                                                    .primary100),
                                                        textAlign:
                                                            TextAlign.left)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                    width: 261,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: ColorResource
                                                              .primary100,
                                                          width: 1),
                                                    ),
                                                    child: ElevatedButton(
                                                        onPressed: () async {
                                                          final initialDate =
                                                              DateTime.now();
                                                          final newDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate: DateTime(
                                                                DateTime.now()
                                                                        .year -
                                                                    5),
                                                            lastDate: DateTime(
                                                                DateTime.now()
                                                                        .year +
                                                                    5),
                                                          );
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .white)),
                                                        child: Row(children: [
                                                          Container(
                                                              width: 18,
                                                              height: 18,
                                                              child: Icon(
                                                                  Icons
                                                                      .calendar_today_rounded,
                                                                  color: ColorResource
                                                                      .black100)),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Container(
                                                              child: Text(
                                                            "Jun 16, 2021 - Jun 17, 2021",
                                                            style: WidgetsStyles
                                                                .textLato400Normal(
                                                                    color: ColorResource
                                                                        .black80,
                                                                    size: 14),
                                                          )),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Container(
                                                              child: Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: ColorResource
                                                                      .black100)),
                                                        ])))
                                              ])),
                                    ]),
                                    Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: 20), //, left: 272),
                                            child: Column(children: [
                                              Container(
                                                  width: 133,
                                                  height: 40,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        tableWidgetState
                                                            .currentState
                                                            ?.downloadTableData();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.white,
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: ColorResource
                                                                .primary100),
                                                        elevation:
                                                            3, //elevation of button
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                //to set border radius to button
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                      ),
                                                      child: Row(children: [
                                                        Icon(Icons.download,
                                                            color: ColorResource
                                                                .primary100),
                                                        Text("Download",
                                                            style: WidgetsStyles
                                                                .textLato700Normal(
                                                                    color: ColorResource
                                                                        .primary100,
                                                                    size: 14))
                                                      ])))
                                            ])),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          DataTableWidget(key: tableWidgetState),
                        ],
                      ),
                    )))));
  }

  void showDropDown() {
    DropDownWidget();
  }

  Widget buildSearch() => SearchWidget(
        text: _searchResult,
        hintText: 'Search Center',
        onChanged: searchCenter,
      );

  void searchCenter(String _searchResult) {
    print('Search Result:$_searchResult');

    // final reports = allReports.where((report) {
    //   final titleLower = report.centerName.toLowerCase();
    //   final authorLower = report.status.toLowerCase();
    //   final searchLower = _searchResult.toLowerCase();

    //   return titleLower.contains(searchLower) ||
    //       authorLower.contains(searchLower);
    // }).toList();

    // setState(() {
    //   this._searchResult = _searchResult;
    //   this.reports = reports;
    // });
  }
}
