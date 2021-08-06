import 'package:flutter/material.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';

const openProductsURL =
    'https://react-my-burger-64464-default-rtdb.firebaseio.com/royaltyReport.json?print=pretty';

class WidgetsStyles {
  // Fields DataTable
  static TextStyle textLato400Normal(
      {Color color = ColorResource.black100, double size = 12}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
    );
  }
  //WidgetsStyles.textLato400Normal(color: textColor, size: 12)

  static TextStyle textRoboto500Normal(
      {Color color = ColorResource.reportTitle, double size = 20}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Roboto',
    );
  }

  //Header DataTable
  static TextStyle textLato700Normal(
      {Color color = ColorResource.primary, double size = 12, backgroundColor = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
      backgroundColor: backgroundColor,
    );
  }
}
