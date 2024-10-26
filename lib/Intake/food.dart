import 'package:app/bar/top_bar.dart';
import 'package:flutter/material.dart';

class FoodIntakePage extends StatefulWidget {
  const FoodIntakePage({super.key});

  @override
  _FoodIntakePage createState() => _FoodIntakePage();
}

class _FoodIntakePage extends State<FoodIntakePage> {
  int target = 2000; // Target for daily calories
  int remainingIntake = 2000; // Remaining calories can take

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
                'Current Intake:\n ${remainingIntake.toStringAsFixed(0)} kcal',
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
                // eat button
                GestureDetector(
                  onTap: () => _chooseCaloriesVolume(context),
                  child: buttonWidget('Eat'),
                ),
              ],
            ),
          ),
        ],
      ),
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
              labelText: 'Enter target (kcal)',
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
                //input is the variable that get the data of the daily target kcal
                final input = int.tryParse(targetController.text);
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

  // Open dialog to choose eat volume
  void _chooseCaloriesVolume(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController caloriesController =
            TextEditingController();
        return AlertDialog(
          title: const Text('Enter amount of calories'),
          content: TextField(
            controller: caloriesController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter calories (kcal)',
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
                final input = int.tryParse(caloriesController.text);
                if (input != null && input > 0) {
                  setState(() {
                    remainingIntake -= input;
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

  // Reset calories intake
  void _resetIntake() {
    setState(() {
      remainingIntake = target;
    });
  }
}
