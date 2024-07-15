import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/events.dart';

class CalendarController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  late final ValueNotifier<List<Event>> selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;

  /// Inicializar los componentes
  @override
  void onInit() {
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
    super.onInit();
  }

  //Realizar el dispose al valueNotifier
  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  //
  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  //
  void onDaySelected(DateTime day, DateTime focus) {
    if (!isSameDay(selectedDay, day)) {
      selectedDay = day;
      focusedDay = focus;
      selectedEvents.value = getEventsForDay(day);
      update();
    }
  }

  //
  void createEvent() {
    debugPrint("Selected Day value: $selectedDay");
  }

  void updateCalendarFormat(CalendarFormat format) {
    calendarFormat = format;
    update();
  }
  //
}
