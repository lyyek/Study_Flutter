import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';

void main() {
  //ApiService().getTodaysToons(); //:API 작동 디버그 콘솔에서 확인 가능
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
