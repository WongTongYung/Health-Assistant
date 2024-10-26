import 'package:app/bar/top_bar.dart';
import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  double target = 1.0; // Target for daily water intake in liters
  double remainingIntake = 1.0; // Remaining water intake to reach the target

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Today\'s Goal',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.square(
                dimension: 300,
                child: CircularProgressIndicator(
                  value: remainingIntake / target,
                  color: Colors.blue,
                  strokeWidth: 25,
                ),
              ),
              Text(
                'Remaining Intake\n ${(remainingIntake * 1000).toStringAsFixed(0)} ml',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            height: 120,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Target button
                GestureDetector(
                  onTap: () => _setTarget(context),
                  child: buttonWidget('Target'),
                ),
                // Reset button
                GestureDetector(
                  onTap: _resetIntake,
                  child: buttonWidget('Reset'),
                ),
                // Drink button
                GestureDetector(
                  onTap: () => _chooseDrinkVolume(context),
                  child: buttonWidget('Drink'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Water Intake Log',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }

  // Helper method for buttons
  Widget buttonWidget(String text) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Open dialog to set target
  void _setTarget(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController targetController = TextEditingController();
        return AlertDialog(
          title: const Text('Set Daily Target'),
          content: TextField(
            controller: targetController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter target (liters)',
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            // Set Target button
            TextButton(
              onPressed: () {
                final input = double.tryParse(targetController.text);
                if (input != null && input > 0) {
                  setState(() {
                    target = input;
                    remainingIntake = target; // Reset remaining intake to match
                  });
                }
                Navigator.of(context)
                    .pop(); // Close the dialog after setting the target
              },
              child: const Text('Set Target'),
            ),
          ],
        );
      },
    );
  }

  // Open dialog to choose drink volume
  void _chooseDrinkVolume(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController drinkController = TextEditingController();
        return AlertDialog(
          title: const Text('Enter Volume of Water'),
          content: TextField(
            controller: drinkController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter volume (ml)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final input = double.tryParse(drinkController.text);
                if (input != null && input > 0) {
                  setState(() {
                    remainingIntake -= input / 1000; // Convert ml to liters
                    if (remainingIntake <= 0) {
                      // Display a congratulatory message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Congratulations! You have met your daily goal.'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      remainingIntake = 0; // Prevent negative intake
                    }
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Reset water intake
  void _resetIntake() {
    setState(() {
      remainingIntake = target;
    });
  }
}
