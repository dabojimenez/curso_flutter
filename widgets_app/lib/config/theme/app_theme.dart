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
  final bool isDarkMode;

  const AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Selectd color must be greater en 0'),
      assert(
        selectedColor < colorList.length,
        'Selectd color must be less than ${colorList.length}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );

  // copyWith: metodo que nos permite copiar una isntancia de la clase AppTheme
  // y modificar los valores que necesitemos
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
