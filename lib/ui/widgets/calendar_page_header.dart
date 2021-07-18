import 'package:calendar_sample/ui/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// カレンダーのヘッダー部分のWidget
class CalendarPageHeader extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(calendarViewModelProvider);

    return Container(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 8.0,
      ),
      child: Container(
        height: 48.0,
        child: Stack(
          children: [
            DropdownButton<String>(
              onChanged: (String? newValue) {
                viewModel.upedateDropDownValue(newValue!);
              },
              value: viewModel.dropdownValue,
              items: viewModel.initialWeekday.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Center(
              child: Text(
                viewModel.monthLabel,
                style: TextStyle(
                  color: const Color(0xFF2D2E2F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
