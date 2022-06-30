import 'package:flutter/material.dart';

import '../Colors/AppColor.dart';

TextStyle textFormFieldStyle() => const TextStyle(
      color: AppColor.lightGreen,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );

TextStyle textFormFieldStyleWithDarkGreen() => const TextStyle(
      color: AppColor.darkGreen,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );
TextStyle homeScreenTextStyle() => const TextStyle(
      color: AppColor.white,
      fontSize: 30,
      fontWeight: FontWeight.w800,
    );

TextStyle deleteButtonTextStyle() => const TextStyle(
      color: AppColor.red,
      decoration: TextDecoration.underline,
      fontSize: 13,
    );

TextStyle settingBackTextStyle() => const TextStyle(
      color: AppColor.white,
      fontSize: 22,
      fontWeight: FontWeight.w800,
    );

TextStyle clinicNAPValuresStyle() => const TextStyle(
      color: AppColor.black,
      fontSize: 13,
      // fontWeight: FontWeight.w600,
    );
TextStyle settingScreenTextStyle() => const TextStyle(
      color: AppColor.darkGreen,
      fontSize: 20,
      // fontWeight: FontWeight.w600,
    );

TextStyle medicalInfoItemTextStyle() => const TextStyle(
      color: AppColor.grey,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
InputDecoration textFormFieldInputDecoration() => InputDecoration(
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.lightGreen, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      hintStyle: textFormFieldStyle(),
    );
