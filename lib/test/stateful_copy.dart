//The purpose of stateful is to keep the thing dynamic
//The purpose of stateless is to keep the thing static

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState(); //_means private
}

class _MyAppState extends State<MyApp> {
  String displayText = 'Hello, World123!!!!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget Example'),
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          //backgroundColor: Color.fromARGB(255, 126, 62, 57),
          child: Text('Hi Mom'),
        ),
      ),
    );
  }
}
