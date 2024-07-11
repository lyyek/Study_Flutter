import 'package:flutter/material.dart';
import 'package:pomodoro_assignment/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xffe64d3d),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        cardColor: const Color(0xffffffff),
      ),
      home: const HomeScreen(),
    );
  }
}
