import 'package:flutter/material.dart';

import '../Colors/AppColor.dart';

class BaseExpansionTile extends StatelessWidget {
  final List<Widget> body;
  final String title;
  const BaseExpansionTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: ExpansionTile(
          title: Text(
            title,
          ),
          backgroundColor: AppColor.lightGreen,
          collapsedBackgroundColor: AppColor.lightGreen,
          textColor: AppColor.white,
          collapsedTextColor: AppColor.white,
          iconColor: AppColor.white,
          collapsedIconColor: AppColor.white,
          children: body,
        ),
      ),
    );
  }
}
