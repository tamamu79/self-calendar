import 'package:calendar_sample/ui/widgets/calendar_page_header.dart';
import 'package:calendar_sample/ui/calendar_view_model.dart';
import 'package:calendar_sample/ui/widgets/monthly_calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarPage extends HookWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(calendarViewModelProvider);

    useEffect(() {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        viewModel.createCalendarList();
      });
      return null;
    }, []);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                child: CalendarPageHeader(),
              ),
              Expanded(
                child: Container(
                  child: viewModel.calendarMonthDate.isEmpty
                      ? Container()
                      : PageView.builder(
                          onPageChanged: (pageNumber) async {
                            if (viewModel.currentPage < pageNumber) {
                              viewModel.moveNextMonth();
                            } else {
                              viewModel.movePreviousMonth();
                            }
                          },
                          controller: viewModel.pageController,
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          itemBuilder: (context, index) {
                            return MonthlyCalendarPage(
                              calendarMonthDate: viewModel.calendarMonthDate,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
