import 'package:app/tutorial/app_bar.dart';
import 'package:app/tutorial/bottom_bar.dart';
import 'package:app/tutorial/second_page.dart';
import 'package:flutter/material.dart';
import 'ad_slider.dart';

void main() {
  runApp(MaterialApp(
    home: const Homepage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar used to display the top bar
      appBar: const TopBar(),
      //This is used to display the bottom bar
      bottomNavigationBar: const BottomBar(),

      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                //coding of this part i think can be improved
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "images/profilePicture2.jpg",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Keep the text visible
                      const Text(
                        'Welcome Brooke Cagle!!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // Make the Card invisible if needed
                      Opacity(
                        opacity: 0.0, // Set opacity to 0 to make it invisible
                        child: Card(
                          color: Colors.grey[200],
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Any content inside here will not be visible
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AdSlider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400], // Use a health-related color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  height: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/health.jpg", // Add your health-related image path
                        width: 300,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Prioritize Your Health: Tips for Well-Being!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Stay active, eat well, and manage stress.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          // Define what happens when the button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green[400],
                          backgroundColor: Colors.white, // Text color
                        ),
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ),
              ),
              //to display the word summary
              const SizedBox(height: 10.0),
              const Text("Today Summary",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  SizedBox(
                    height: 600, // Set a height for the GridView
                    child: GridView.count(
                      crossAxisCount: 2, // Number of columns
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            //wrap with material to ensure ripple effect
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[500],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              height: 100,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center content vertically
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "images/water.jpg",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit
                                          .cover, //optional since width and height is used
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          5.0), // Space between image and text
                                  const Text(
                                    "Water Intake: 100ml",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            //wrap with material to ensure ripple effect
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red[500],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              height: 100,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center content vertically
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "images/step.jpg",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          5.0), // Space between image and text
                                  const Text(
                                    "Steps: 3456",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            //wrap with material to ensure ripple effect
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber[200],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              height: 100,
                              alignment: Alignment.topCenter,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center content vertically
                                children: [
                                  Text(
                                    "Daily Quote",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Don't forget to drink water!\nStay hydrated throughout the day!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            //wrap with material to ensure ripple effect
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber[200],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              height: 100,
                              alignment: Alignment.topCenter,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center content vertically
                                children: [
                                  Text(
                                    "Daily Quote",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Don't forget to drink water!\nStay hydrated throughout the day!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
