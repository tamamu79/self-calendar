import 'package:calendar_sample/data/entity/calendar_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// カレンダーの日を表すWidget
class DateCell extends HookWidget {
  DateCell({
    @required CalendarDate? calendarDate,
  }) : calendarDate = calendarDate;

  final CalendarDate? calendarDate;

  @override
  Widget build(BuildContext context) {
    Color dateTextColor() {
      if (calendarDate!.enabled) {
        return const Color(0xFF2D2E2F);
      } else {
        return const Color(0xFFD6D6D6);
      }
    }

    return Expanded(
      child: SizedBox(
        child: Material(
          child: Ink(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.0,
                    height: 32.0,
                    child: Center(
                      child: Text(
                        calendarDate!.day.toString(),
                        style: TextStyle(
                          color: dateTextColor(),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
