import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controllers/calendar_controller.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CalendarController ctrl) {
        return Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2033, 12, 31),
              focusedDay: ctrl.focusedDay,
              onDaySelected: ctrl.onDaySelected,
              startingDayOfWeek: StartingDayOfWeek.monday,
              eventLoader: ctrl.getEventsForDay,
              onPageChanged: (focusedDay) {
                ctrl.focusedDay = focusedDay;
              },
              selectedDayPredicate: (day) {
                return isSameDay(ctrl.selectedDay, day);
              },
              onFormatChanged: (format) {
                if (ctrl.calendarFormat != format) {
                  ctrl.updateCalendarFormat(format);
                }
              },
            ),
            const SizedBox(height: 8.0),
          ],
        );
      },
    );
  }
}
