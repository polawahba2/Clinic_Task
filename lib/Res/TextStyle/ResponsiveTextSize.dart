import 'package:flutter/cupertino.dart';

class ResponsiveTextSize {
  const ResponsiveTextSize();
  getResponsiveTextSize(BuildContext context, dynamic size) {
    return (size / 720) * MediaQuery.of(context).size.height;
  }
}
