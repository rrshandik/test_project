import 'package:flutter/material.dart';

class AppColors {
  static const red = Color.fromARGB(255, 157, 45, 52);
  static const pink = Color.fromARGB(255, 219, 161, 165);
  static const grey = Color.fromARGB(255, 167, 169, 172);
  static const black = Color.fromARGB(0, 0, 0, 0);
  static const white = Color.fromARGB(255, 255, 255, 255);
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: 'Bold',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: AppColors.black,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Regular',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.black,
  );

  static TextStyle light = const TextStyle(
    fontFamily: 'Thin',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: Color.fromARGB(255, 194, 194, 194),
  );
}
