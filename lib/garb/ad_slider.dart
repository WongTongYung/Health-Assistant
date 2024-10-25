import 'dart:async';
import 'package:flutter/material.dart';

class AdSlider extends StatefulWidget {
  const AdSlider({super.key});

  @override
  _AdSliderState createState() => _AdSliderState(); //similar to this
  //int add(int a, int b) {
  //return a + b;
  //}
}

class _AdSliderState extends State<AdSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 300,
        child: PageView(
          controller: _pageController,
          children: [
            _buildAd(
              imagePath: "images/health.jpg",
              title: 'Prioritize Your Health: Tips for Well-Being!',
              subtitle: 'Stay active, eat well, and manage stress.',
            ),
            _buildAd(
              imagePath:
                  "images/water.jpg", // Replace with your second image path
              title: 'Stay Fit: Tips for a Healthy Lifestyle!',
              subtitle: 'Exercise regularly and keep moving.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAd(
      {required String imagePath,
      required String title,
      required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 300,
            height: 170,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            subtitle,
            style: const TextStyle(
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
              backgroundColor: Colors.white,
            ),
            child: const Text('Learn More'),
          ),
        ],
      ),
    );
  }
}
