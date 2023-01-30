import 'package:flutter/material.dart';
import 'package:lukytudoapp/responsive/dimenions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopApp;

  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopApp});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return desktopApp;
        }
      },
    );
  }
}
