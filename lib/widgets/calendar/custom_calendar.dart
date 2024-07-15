import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controllers/calendar_controller.dart';

class CustomCalendar extends StatelessWidget {
  CustomCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CalendarController ctrl) {
        return TableCalendar(
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2033, 12, 31),
          focusedDay: ctrl.focusedDay,
          onDaySelected: ctrl.onDaySelected,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onPageChanged: (focusedDay) {
            ctrl.focusedDay = focusedDay;
          },
          selectedDayPredicate: (day) {
            return isSameDay(ctrl.selectedDay, day);
          },
        );
      },
    );
  }
}
