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
      //scaffold allow to use appbar
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text("Basic Tutorial"),
      ),
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.all(8), //spacing betwwen the text in the box
          //color: Colors.red[400],  //since decoration use color no need le else error
          width: 100,
          height: 100,
          //clipBehavior: Clip.none, //use to remove border
          alignment: Alignment.center,
          decoration: BoxDecoration(
              //useful feature to add images or color
              color: Colors.red[300],
              //shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Colors.red,
                Colors.blue
              ]), //paint the box with 2 colors
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7,
                ),
              ]),
          child: const Text(
            "I'm brokestick",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
