import 'dart:ui';
import 'package:ecom_project/util/dimension.dart';
import 'package:ecom_project/util/styles.dart';
import 'package:ecom_project/util/colors.dart';

import 'package:flutter/material.dart';

const popoinLite=TextStyle(
  fontFamily: 'Popins',
  fontSize: Dimension.fontSizeDefault,
  fontWeight: FontWeight.w300
);
const popoinMeduim=TextStyle(
    fontFamily: 'Popins',
    fontSize: Dimension.fontSizeDefault,
    fontWeight: FontWeight.w400
);
const popoinRegular=TextStyle(
    fontFamily: 'Popins',
    fontSize: Dimension.fontSizeDefault,
    fontWeight: FontWeight.w500
);
const popoinSmiBold=TextStyle(
    fontFamily: 'Popins',
    fontSize: Dimension.fontSizeDefault,
    fontWeight: FontWeight.w600
);
const popoinBold=TextStyle(
    fontFamily: 'Popins',
    fontSize: Dimension.fontSizeDefault,
    fontWeight: FontWeight.w700
);


const Color secondary_Color =  Color(0xFF263572);
const Color primary_color  =    Color(0xFF0C1029);
const Color bg_color=Colors.black87;
const Color BackGroundColor=Color(0xFFD2FFDD);
//Theme Data
ThemeData lightTheme=ThemeData(

  brightness: Brightness.light,
  primaryColor: primary_color,
);
ThemeData darkThem=ThemeData(
    brightness: Brightness.dark,primaryColor: primary_color);
var boxShadows=[
  BoxShadow(
  color:AppsColors.darkShadow,
offset: const Offset(2.0,2.0),
  blurRadius: 2.0,
  spreadRadius: 2.0),
  BoxShadow(
      color:AppsColors.lightShadow,
      offset: const Offset(-2.0,-2.0),
  blurRadius: 2.0,
  spreadRadius: 2.0)
];