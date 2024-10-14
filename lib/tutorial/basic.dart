import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Homepage(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
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
//hmmmmm not sure 