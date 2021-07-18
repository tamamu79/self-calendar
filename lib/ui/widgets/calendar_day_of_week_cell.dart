import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 曜日を表示するWidget
class CalendarDayOfWeekCell extends StatelessWidget {
  CalendarDayOfWeekCell({
    @required this.dayOfWeek,
  });

  final String? dayOfWeek;

  @override
  Widget build(Object context) {
    return Expanded(
      child: SizedBox(
        height: 24.0,
        child: Center(
          child: Text(
            dayOfWeek!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
