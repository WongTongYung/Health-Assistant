import 'package:app/tutorial/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text("Basic Tutorial"),
      ),
      body: Container(
        color: Colors.grey[230],
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns children at the top
          children: [
            Container(
              color: Colors.teal,
              height: 150,
              padding: const EdgeInsets.all(20),
              child: Row(
                  //if replace with columm become vertical main and cross become vertical
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, //spacing between row
                  crossAxisAlignment: CrossAxisAlignment
                      .end, //spacing between the container for row
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
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text("Hi i am a drawer."),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("pawn Kumar"),
            )
          ],
        ),
      ), //automatic added to the top left
      floatingActionButton: FloatingActionButton(
        //floating action button in the bottom right corner
        onPressed: () {}, //put thing in the bracket
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          //height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
