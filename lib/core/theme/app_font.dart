import 'package:flutter/material.dart';

import 'app_color.dart';

extension CustomStyles on TextTheme {
  TextStyle get h1 {
    return const TextStyle(
      fontSize: 48.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h2 {
    return const TextStyle(
      fontSize: 32.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h3 {
    return const TextStyle(
      fontSize: 24.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h4 {
    return const TextStyle(
      fontSize: 20.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h5 {
    return const TextStyle(
      fontSize: 16.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h6 {
    return const TextStyle(
      fontSize: 14.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get h7 {
    return const TextStyle(
      fontSize: 12.0,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get text24 {
    return const TextStyle(
      fontSize: 24.0,
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get text20 {
    return const TextStyle(
      fontSize: 20.0,
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get text16 {
    return const TextStyle(
      fontSize: 16.0,
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get text14 {
    return const TextStyle(
      fontSize: 14.0,
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get text12 {
    return const TextStyle(
      fontSize: 12.0,
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    );
  }
}
