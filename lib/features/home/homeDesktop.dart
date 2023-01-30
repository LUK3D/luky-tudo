import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = Get.mediaQuery.size.width;
    return Scaffold(
      body: Center(
        child: Text("${currentWidth}px"),
      ),
    );
  }
}
