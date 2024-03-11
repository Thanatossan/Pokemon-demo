import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor primary = MaterialColor(
    0xFFd61010,
    <int, Color>{
      50: Color(0xFFfde7e7),
      100: Color(0xFFfab8b8),
      200: Color(0xFFf68888),
      300: Color(0xFFf35959),
      400: Color(0xFFef2929),
      500: Color(0xFFd61010),
      600: Color(0xFFa60c0c),
      700: Color(0xFF770909),
      800: Color(0xFF470505),
      900: Color(0xFF180202),
    },
  );
  static const MaterialColor white = MaterialColor(0xffFFFFFF, <int, Color>{
    500: Color(0xffFFFFFF),
  });
  static const MaterialColor black = MaterialColor(0xff000000, <int, Color>{
    500: Color(0xff000000),
  });
  static const MaterialColor error = MaterialColor(0xffeb5757, <int, Color>{
    500: Color(0xffeb5757),
  });

  static const MaterialColor success = MaterialColor(0xff3DB674, <int, Color>{
    500: Color(0xff3DB674),
  });
}
