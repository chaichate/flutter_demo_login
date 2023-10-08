import 'package:flutter/material.dart';

class Styles {
  static const primaryColor = Color(0xFF7210FF);
  static const secondaryColor = Color(0xFFFFD300);
  static const successColor = Color(0xFF4ADE80);
  static const infoColor = Color(0xFF246BFD);
  static const warningColor = Color(0xFFFACC15);
  static const errorColor = Color(0xFFF75555);
  static const disableColor = Color(0xFFD8D8D8);
  static const disableButtonColor = Color(0xFF6F3ABB);
  static const greyColor900 = Color(0xFF212121);
  static const greyColor800 = Color(0xFF424242);
  static const greyColor700 = Color(0xFF616161);
  static const greyColor600 = Color(0xFF757575);
  static const greyColor500 = Color(0xFF9E9E9E);
  static const greyColor400 = Color(0xFFBDBDBD);
  static const greyColor300 = Color(0xFFE0E0E0);
  static const greyColor200 = Color(0xFFEEEEEE);
  static const greyColor100 = Color(0xFFF5F5F5);
  static const greyColor50 = Color(0xFFFAFAFA);
  static const darkColor1 = Color(0xFF181A20);
  static const darkColor2 = Color(0xFF1F222A);
  static const darkColor3 = Color(0xFF35383F);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);

  static const TextStyle _text =
      TextStyle(color: blackColor, fontFamily: 'Prompt', fontSize: 16);

  static final regular =
      _text.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
  static final medium =
      _text.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static final semibold =
      _text.copyWith(fontSize: 18, fontWeight: FontWeight.w600);
  static final bold = _text.copyWith(fontSize: 18, fontWeight: FontWeight.w700);

  static final h1 = bold.copyWith(fontSize: 48);
  static final h2 = bold.copyWith(fontSize: 40);
  static final h3 = bold.copyWith(fontSize: 32);
  static final h4 = regular.copyWith(fontSize: 24, color: blackColor);
  static final h5 = regular.copyWith(fontSize: 20, color: blackColor);
  static final h6 = regular.copyWith(fontSize: 18, color: blackColor);

  static final bodyXl = regular.copyWith(fontSize: 18);
  static final bodyL = regular.copyWith(fontSize: 16);
  static final bodyM = regular.copyWith(fontSize: 14);
  static final bodyS = regular.copyWith(fontSize: 12);
  static final bodyXs = regular.copyWith(fontSize: 10);
}
