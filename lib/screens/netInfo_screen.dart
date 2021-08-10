import 'dart:html';

import 'package:flutter/material.dart';


class NetInfoScreen extends StatelessWidget {

  NetInfoScreen({required this.price});
  final price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Net Info'
          ),
        ),
        body: Center(
          child: Text(
            'This is Net Example $price',
          ),
        ),
      )
    );
  }
}

