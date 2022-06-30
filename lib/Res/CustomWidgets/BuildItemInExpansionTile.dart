import 'package:flutter/material.dart';

import '../Colors/AppColor.dart';
import '../TextStyle/TextStyles.dart';

class BuildItemInExpansionTile extends StatelessWidget {
  final String title;
  final Widget secoundBart;
  final bool needElivation;
  const BuildItemInExpansionTile({
    Key? key,
    required this.title,
    required this.secoundBart,
    this.needElivation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColor.white,
          height: 45,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: textFormFieldStyle(),
                ),
              ),
              Expanded(
                flex: 5,
                child: Material(
                  elevation: needElivation ? 4 : 0,
                  borderRadius: BorderRadius.circular(12),
                  child: secoundBart,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColor.white,
          height: 7,
        ),
      ],
    );
  }
}
