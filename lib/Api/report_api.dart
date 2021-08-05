import 'package:datatablewebpoc/service/networking.dart';
import 'package:datatablewebpoc/utilities/constants.dart';

class ReportData {
  Future<dynamic> getReportData() async {
    NetworkHelper networkHelper = NetworkHelper('$openProductsURL');

    var productData = await networkHelper.getData();
    return productData;
  }
}
