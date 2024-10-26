import 'package:app/Steps/dates.dart';
import 'package:app/Steps/graph.dart';
import 'package:app/Steps/steps.dart';
import 'package:app/bar/top_bar.dart';
import 'package:flutter/material.dart';

class StepPage extends StatefulWidget {
  const StepPage({super.key});

  @override
  State<StepPage> createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Column(children: [
          SizedBox(height: 15.0),
          Dates(),
          Steps(),
          Graph(),
          //info(),
          //Stats(label: '',),
        ]));
  }
}
