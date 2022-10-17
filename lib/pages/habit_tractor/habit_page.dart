import 'dart:async';

import 'package:flutter/material.dart';

import 'components/habit_tile.dart';

class HabitTracerPage extends StatefulWidget {
  const HabitTracerPage({Key? key}) : super(key: key);

  @override
  State<HabitTracerPage> createState() => _HabitTracerPageState();
}

class _HabitTracerPageState extends State<HabitTracerPage> {
  // overall habit summary
  List<dynamic> habitList = [
    // [ habitName, habitStarted, timeSpent(sec), timeGoal(min) ]
    ['Exercise', false, 0, 1],
    ['Read', false, 0, 5],
    ['Meditate', false, 0, 10],
    ['Code', false, 0, 20],
  ];

  void habitStarted(int index) {
    // note what the start time is
    var startTime = DateTime.now();

    // include the time already elapsed
    int elapsedTime = habitList[index][2];

    // habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    if (habitList[index][1]) {
      // keep the time going!
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          // check when the user has stopped the timer
          if (!habitList[index][1]) {
            timer.cancel();
          }

          // calculate the time elapsed by comparing current time and state time
          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime +
              currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingsOpend(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Setting for ' + habitList[index][0]),
          actions: [
            MaterialButton(
              color: Colors.green[300],
              child: const Text(
                "중지",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Timer.periodic(
                  const Duration(seconds: 1),
                  (timer) {
                    setState(() {
                      timer.cancel();
                      return;
                    });
                  },
                );
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black,
              child: const Text(
                "계속",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Habit Tracker'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8),
        color: Colors.deepPurple[300],
        child: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: habitList[index][0],
              onTimeTap: () {
                habitStarted(index);
              },
              settingsTapped: () {
                settingsOpend(index);
              },
              habitStarted: habitList[index][1],
              timeSpent: habitList[index][2],
              timeGoal: habitList[index][3],
            );
          },
        ),
      ),
    );
  }
}
