import 'package:flutter/material.dart';

class Constats {
  Constats._(); // bundan nesne uretmek istemiyorsak. kurucu metodu gizli yapiyoruz

  static const String title = 'Timezone';

  static const Color kPrimaryColor = Color.fromARGB(255, 227, 238, 255);

  static const Color kBackGroundLightColor = Colors.white;

  static const Color kSecondaryDarkColor = Color.fromARGB(255, 2, 50, 125);

  static const Color kBackGroundDarkColor = Color.fromARGB(255, 0, 35, 89);

  static const Color kPrimaryTextColor = Color.fromARGB(255, 0, 35, 89);

  static const Color kSecondaryTextColor = Colors.white;

  static getCityTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 36.1,
        color: kBackGroundDarkColor);
  }

  static getDayAndMonthTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 27.07,
        color: kBackGroundDarkColor);
  }
}
