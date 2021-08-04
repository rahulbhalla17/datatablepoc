// import 'dart:convert';
// import 'package:datatablewebpoc/model/report.dart';
//
// import 'package:http/http.dart' as http;
//
// class BooksApi {
//   static Future<List<Report>> getBooks(String query) async {
//     final url = Uri.parse(
//         'https://react-my-burger-64464-default-rtdb.firebaseio.com/royaltyReport.json?print=pretty');
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final List reports = json.decode(response.body);
//
//       return reports.map((json) => Report.fromJson(json)).where((report) {
//         final adjustment = report.adjustment;
//         final calculated = report.calculated;
//         final centerName = report.centerName;
//         final date = report.date.toLowerCase();
//         final net = report.net;
//         final notes = report.notes.toLowerCase();
//         final paymentType = report.paymentType;
//         final status = report.status;
//
//         return titleLower.contains(searchLower) ||
//             authorLower.contains(searchLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }
// }
