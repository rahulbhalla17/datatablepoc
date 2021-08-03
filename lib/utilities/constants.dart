import 'package:flutter/material.dart';
import 'package:datatablewebpoc/utilities/ColorsConfig.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

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
      {Color color = ColorResource.primary, double size = 12}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
    );
  }

  //Header DataTable
  static TextStyle textLato700NormalGreenColor(
      {Color color = ColorResource.primary, double size = 12}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
    );
  }

  static TextStyle textLato400NormalOrangeColor(
      {Color color = ColorResource.orangeText, double size = 12}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
    );
  }

  static TextStyle textLato400NormalGreenColor(
      {Color color = ColorResource.greenText, double size = 12}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontFamily: 'Lato',
    );
  }
}
