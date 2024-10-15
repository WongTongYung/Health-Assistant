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
      body: Container(
        color: Colors.teal,
        height: 200,
        width: 500,
        child: Row(
            //if replace with columm become vertical main and cross become vertical
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, //spacing between row
            crossAxisAlignment:
                CrossAxisAlignment.end, //spacing between the container for row
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(
                    8), //spacing betwwen the text in the box
                color: Colors.red[
                    400], //since decoration use color no need le else error
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              Container(
                padding: const EdgeInsets.all(
                    8), //spacing betwwen the text in the box
                color: Colors.red[
                    300], //since decoration use color no need le else error
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              Container(
                padding: const EdgeInsets.all(
                    8), //spacing betwwen the text in the box
                color: Colors.red[
                    200], //since decoration use color no need le else error
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
            ]),
      ),
    );
  }
}
