import 'package:app/dailyQuote/display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health tracker app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[300]!,
        ),
        useMaterial3: true,
      ),
      //home: const Homepage(),
      //home: const LoginScreen(),
      home: const Display(),
    );
  }
}
