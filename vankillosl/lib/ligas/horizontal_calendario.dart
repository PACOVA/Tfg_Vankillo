import 'package:flutter/material.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int weekday = now.weekday;
    final DateTime startOfWeek = now.subtract(Duration(days: weekday - 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < 7; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  _getWeekdayAbbreviation(i),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${startOfWeek.day + i}',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == weekday - 1
                        ? Colors.amber[900]
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  String _getWeekdayAbbreviation(int index) {
    switch (index) {
      case 0:
        return 'lu';
      case 1:
        return 'ma';
      case 2:
        return 'mi';
      case 3:
        return 'ju';
      case 4:
        return 'vi';
      case 5:
        return 'sa';
      case 6:
        return 'do';
      default:
        return '';
    }
  }
}
