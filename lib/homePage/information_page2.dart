import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Information Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Did You Know?', // Your text here
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            buildInfoContainer(
              color: Colors.red[200]!,
              title: 'Tobacco',
              description:
                  'The tobacco epidemic is one of the biggest public health threats the world has ever faced, killing over 8 million people a year around the world. More...',
            ),
            buildInfoContainer(
              color: Colors.blue[200]!,
              title: 'Health Effects',
              description:
                  'Smoking causes various health issues, including lung cancer, heart disease, and respiratory problems. More...',
            ),
            buildInfoContainer(
              color: Colors.green[200]!,
              title: 'Drinking water',
              description:
                  'Safe and readily available water is important for public health, whether it is used for drinking, domestic use, food production or recreational...',
            ),
            buildInfoContainer(
              color: Colors.orange[200]!,
              title: 'Priotize your health, Tips for well-being',
              description:
                  'There are some this you can follow to take care of your health. First is to Eat well. Exercise. Get enough sleep. Stay..',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoContainer({
    required Color color,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        height: 200,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
