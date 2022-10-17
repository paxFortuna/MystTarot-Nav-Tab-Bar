import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTimeTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile({
    Key? key,
    required this.habitName,
    required this.onTimeTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  }) : super(key: key);

  // convert seconds into min: sec -> e.g 62 seconds = 1:02 min
  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(1);
    // 59 sceonds -> 0:59
    // (59/60).toStringAsFixed(1) = 0.9.. = 1

    // if secs is a 1 digit number, place a 0 infront of it
    if (secs.length == 1) {
      secs = '0$secs';
    }
    // if mins is a 1 gigit number
    if (mins[1] == '.') {
      mins = mins.substring(0, 1);
      // 0.98 min -> 0 mins
    }
    return '$mins:$secs';
  }

  // calculatet progerss pecentage
  double percentageCompleted() {
    return timeSpent / (timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onTimeTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        // progress circle
                        CircularPercentIndicator(
                          radius: 30,
                          percent: percentageCompleted() < 1
                              ? percentageCompleted()
                              : 1,
                          progressColor: percentageCompleted() > 0.5
                              ? (percentageCompleted() > 0.75
                              ? Colors.green
                              : Colors.orange)
                              : Colors.red,
                        ),
                        // play pause button
                        Center(
                          child: Icon(
                              habitStarted ? Icons.pause : Icons.play_arrow),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // habit name
                    Text(
                      habitName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    //progress
                    Text(
                      '${formatToMinSec(timeSpent)} / ${formatToMinSec(timeGoal)}'
                          ' = ${(percentageCompleted() * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: settingsTapped,
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
