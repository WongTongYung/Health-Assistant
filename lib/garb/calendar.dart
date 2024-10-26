library calendar;

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class CalendarElement extends StatefulWidget {
  const CalendarElement({super.key});

  @override
  State<CalendarElement> createState() => _CalendarElementState();
}

class _CalendarElementState extends State<CalendarElement> {
  late DateTime _selectedDate;
  late List<DateTime> _eventDates;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));

    _eventDates = [
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 3)),
      DateTime.now().add(const Duration(days: 4)),
      DateTime.now().subtract(const Duration(days: 4))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Column(children: <Widget>[
          CalendarTimeline(
            showYears: true,
            initialDate: _selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 30)),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            eventDates: _eventDates,
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 12,
            monthColor: Colors.white70,
            dayColor: Colors.teal[700],
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.blueAccent[100],
            dotColor: Colors.white,
            // selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),

          // const SizedBox(height: 10),
          // Padding(

          //   padding: const EdgeInsets.only(left: 16),
          // child: TextButton(

          //   style: ButtonStyle(

          //     backgroundColor: WidgetStateProperty.all(Colors.teal[200]),
          //   ),

          //     child: const Text(

          //       'Reset',
          //       style: TextStyle(color: Color(0xFF333A47)),
          //     ),

          //     onPressed: () => setState(() => _resetSelectedDate())
          //   )
          // ),

          // const SizedBox(height: 10),
          Center(
              child: Text(
            'Selected date is $_selectedDate',
            style: const TextStyle(color: Colors.white),
          ))
        ]));
  }
}
