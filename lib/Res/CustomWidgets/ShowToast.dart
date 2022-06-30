import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:technical_task/Res/Colors/AppColor.dart';

void showToast({required String text, Color color = AppColor.green}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: AppColor.white,
      fontSize: 16.0,
    );
