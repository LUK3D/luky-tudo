import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lukytudoapp/features/home/homeMobile.dart';
import 'package:lukytudoapp/responsive/responsive_layout.dart';

import 'features/home/homeDesktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveLayout(
        desktopApp: HomePageDesktop(),
        mobileBody: HomePageMobile(),
      ),
    );
  }
}
