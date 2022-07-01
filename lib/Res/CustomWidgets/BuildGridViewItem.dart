import 'package:flutter/material.dart';

class BuildGridViewItem extends StatelessWidget {
  final String text;
  final String imageString;
  const BuildGridViewItem({
    required this.text,
    required this.imageString,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
        children: [
          Image.asset(imageString, height: 100),
          Text(text),
        ],
      ),
    );
  }
}
