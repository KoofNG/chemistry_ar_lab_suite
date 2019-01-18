import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:chemistry_ar_lab_suite/src/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return MaterialApp(
      title: 'Chemistry AR Suite',
      theme: ThemeData.light(),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
