import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
  ));
}

// ignore: use_key_in_widget_constructors
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text("Basic Tutorial"),
      ),
      body: Container(
        child: const Text("Hello World"),
      ),
    );
  }
}
