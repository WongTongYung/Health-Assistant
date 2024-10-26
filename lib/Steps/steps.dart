import 'package:app/Steps/database_servce.dart';
import 'package:app/Steps/tsk.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  final DatabaseServce _databaseServce = DatabaseServce.instance;
  int _steps = 0;
  Tsk? currentTask;

  double _previousY = 0.0; // To track the previous Y value
  StreamSubscription<AccelerometerEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _loadCurrentTask(); // Load the task when initializing

    // Start listening to accelerometer events
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      print(
          "Accelerometer event: x=${event.x}, y=${event.y}, previousY=$_previousY");
      if (currentTask != null) {
        _onAccelerometerEvent(event, currentTask!);
      }
    });
  }

  void _loadCurrentTask() async {
    List<Tsk> tasks = await _databaseServce.getStepCount();
    if (tasks.isNotEmpty) {
      setState(() {
        currentTask = tasks[0];
        _steps = currentTask!.steps; // Initialize steps from the current task
      });
      print("Current Task: ${currentTask!.id}, Steps: ${currentTask!.steps}");
    } else {
      print("No tasks found in the database.Creating a new database");
      await _databaseServce.addTask(0); // Add a new task with steps of 0
    }
  }

  void _onAccelerometerEvent(AccelerometerEvent event, Tsk task) {
    // Implement a simple step detection algorithm
    double threshold = 0.5; // Adjust this threshold as needed
    // Detecting steps based on changes in the Y-axis acceleration
    if (event.y > threshold && _previousY <= threshold) {
      setState(() {
        _steps++;
      });
      _databaseServce.updateStepCount(task.id, _steps);
      print("$_steps steps have been added to task ${task.id}...");
    }
    _previousY = event.y; // Update previous Y value
  }

  @override
  void dispose() {
    _subscription?.cancel(); // Cancel the subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Text(
            'Steps:',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10), // Optional spacing
          Text(
            '$_steps',
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
