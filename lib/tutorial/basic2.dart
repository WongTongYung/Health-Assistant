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
        color: Colors.teal,
        height: 400, // Increased height to accommodate two rows
        width: 500,
        child: Column(
          // Changed to Column to stack rows
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[400],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 1',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[300],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 2',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[200],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 3',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[400],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 4',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[300],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 5',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[200],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Box 6',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
