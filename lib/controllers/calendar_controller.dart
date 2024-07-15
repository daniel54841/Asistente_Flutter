import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  void onInit() {
    selectedDay = focusedDay;
    super.onInit();
  }

  void onDaySelected(DateTime day, DateTime focus) {
    if (!isSameDay(selectedDay, day)) {
      selectedDay = day;
      focusedDay = focus;
      update();
    }
  }

  void createEvent() {
    debugPrint("Selected Day value: $selectedDay");
  }
}
