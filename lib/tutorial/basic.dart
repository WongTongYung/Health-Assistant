import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Tutorial"),
      ),
    );
  }
}

//qaqaqaqaq
//what can i do 