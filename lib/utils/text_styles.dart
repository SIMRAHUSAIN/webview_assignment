// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:webview_assignment/utils/colors.dart';

abstract class TextStylesFile {
  static var S16_W600_white = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white
  );

  static var S15_W500_black = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: black
  );
  
  static var appBarStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white
  );
}