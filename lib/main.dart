import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:staze_test/page1.dart';
import 'package:staze_test/page2.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MaterialApp(
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final PageController _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageViewController,
      children: [
        Page1(),
        Page2(),
      ],
    ));
  }
}
