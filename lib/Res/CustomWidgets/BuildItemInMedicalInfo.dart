import 'package:flutter/material.dart';
import 'package:technical_task/Res/Colors/AppColor.dart';

import '../TextStyle/TextStyles.dart';

class BuildItemInMedicalInfo extends StatelessWidget {
  final String title;
  final Widget secoundWidget;
  const BuildItemInMedicalInfo(
      {Key? key,
      required this.title,
      this.secoundWidget = const Icon(
        Icons.add_circle_rounded,
        color: AppColor.lightGreen,
        size: 30,
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: medicalInfoItemTextStyle(),
              ),
              secoundWidget,
            ],
          ),
        ),
      ),
    );
  }
}
