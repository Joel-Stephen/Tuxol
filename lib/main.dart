import 'dart:io';

import 'package:app_template/src/screens/home_page.dart';
import 'package:app_template/src/screens/questions_page.dart';
import 'package:app_template/src/screens/score_page.dart';
import 'package:flutter/material.dart';

void main() { runApp(MyApp());
HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

