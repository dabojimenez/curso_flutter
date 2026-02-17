import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.green,
];

class AppTheme {
  final int selectedColor;

  const AppTheme({this.selectedColor = 0})
  : assert (selectedColor >= 0, 'Selectd color must be greater en 0'),
    assert (selectedColor < colorList.length, 'Selectd color must be less than ${colorList.length}')
  ;

  ThemeData getTheme () => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
  );
}