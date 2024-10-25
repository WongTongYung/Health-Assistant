import 'package:app/homePage/info_card.dart';
import 'package:app/bar/top_bar.dart';
import 'package:app/homePage/bottom_bar.dart';
import 'package:app/second_page.dart';
import 'package:app/userRegistration/userdb.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    String? fetchedUsername =
        await dbHelper.getUsername(1); // Replace 1 with the actual user ID
    setState(() {
      username = fetchedUsername!; // Default to 'Guest' if no username found
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar used to display the top bar
      appBar: const TopBar(),
      //This is used to display the bottom bar
      bottomNavigationBar: const BottomBar(),

      body: Container(
        //background colour
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //this part is for profile picture and name
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "images/profilePicture2.jpg",
                          width: 170,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Welcome back $username!!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //this is the advertisement
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
              //This is the part to display the title word summary
              const SizedBox(height: 10.0),
              const Text("Today Summary",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              //This is the section to display the today summary
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 400, // Set a height for the GridView
                    child: GridView.count(
                      crossAxisCount: 2, // Number of columns
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                      children: <Widget>[
                        InfoCard(
                          color: Colors.blue[500]!,
                          imagePath: "images/water.jpg",
                          title: "Water Intake: 100ml",
                          subtitle: "",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecondPage(),
                              ),
                            );
                          },
                        ),
                        InfoCard(
                          color: Colors.red[500]!,
                          imagePath: "images/step.jpg",
                          title: "Steps: 3456",
                          subtitle: "",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecondPage(),
                              ),
                            );
                          },
                        ),
                        InfoCard(
                          color: Colors.amber[200]!,
                          imagePath: "",
                          title: "Daily Quote",
                          subtitle:
                              "Don't forget to drink water!\nStay hydrated throughout the day!",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecondPage(),
                              ),
                            );
                          },
                        ),
                        InfoCard(
                          color: Colors.amber[200]!,
                          imagePath: "",
                          title: "Daily Quote",
                          subtitle:
                              "Don't forget to drink water!\nStay hydrated throughout the day!",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecondPage(),
                              ),
                            );
                          },
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
