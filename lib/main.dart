import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lukytudoapp/features/home/homeMobile.dart';
import 'package:lukytudoapp/responsive/responsive_layout.dart';
import 'package:window_manager/window_manager.dart';

import 'features/home/homeDesktop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1200, 600));
    // WindowManager.instance.setMaximumSize(const Size(1200, 600));
  }

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
