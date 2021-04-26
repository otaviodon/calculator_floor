import 'core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme_app.dart';
import 'package:flutter_application_1/pages/calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: kAppTheme,
      home: CalculatorPage(),
    );
  }
}
