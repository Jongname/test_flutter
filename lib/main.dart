import 'package:flutter/material.dart';

import 'home_page.dart';
import 'constants/material_white.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}


