import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../net/data/alarm_info.dart';
import '../net/data/menu_info.dart';
import '../persistence/helpers/alarm_helper.dart';
import '../views/alarms/alarm_view.dart';
import '../views/alarms/clock_view.dart';

class AlarmsController extends GetxController {
  DateTime? alarmTime;
  String alarmTimeString = "Alarma";
  bool isRepeatSelected = false;
  AlarmHelper _alarmHelper = AlarmHelper();

  List<AlarmInfo>? currentAlarms = [];

  List<MenuInfo> menuItems = [
    MenuInfo(MenuType.clock,
        title: 'Reloj', imageSource: 'assets/alarms_timer/clock_icon.png'),
    MenuInfo(MenuType.alarm,
        title: 'Alarmas', imageSource: 'assets/alarms_timer/alarm_icon.png'),
    /* TODO: Futurible
    Diseño posible     https://github.com/afzalali15/flutter_alarm_clock/tree/master
    MenuInfo(MenuType.timer,
        title: 'Temporizador',
        imageSource: 'assets/alarms_timer/timer_icon.png'),
    MenuInfo(MenuType.stopwatch,
        title: 'Cronometro',
        imageSource: 'assets/alarms_timer/stopwatch_icon.png'),
  */
  ];

  late Future<List<AlarmInfo>> alarms;

  @override
  void onInit() {
    alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase();
    debugPrint("Database Inicializada de forma correccta");
    loadAlarms();
    super.onInit();
  }

  MenuType menuType = MenuType.clock;

  void loadAlarms() {
    alarms = _alarmHelper.getAlarms();
    update();
  }

  void updateMenuType(MenuInfo type) {
    if (type.menuType == MenuType.clock) {
      menuType = MenuType.clock;
    } else if (type.menuType == MenuType.alarm) {
      menuType = MenuType.alarm;
    } else if (type.menuType == MenuType.stopwatch) {
      menuType = MenuType.stopwatch;
    } else {
      menuType = MenuType.timer;
    }
    update();
  }

  Widget setView() {
    if (menuType == MenuType.clock) {
      return ClockView();
    } else if (menuType == MenuType.alarm) {
      return const AlarmView();
    } else {
      return const Center(
        child: Text("Pendiente de implementar"),
      );
    }
  }

  void deleteAlarm(int? id) {
    _alarmHelper.delete(id);
    update();
    loadAlarms(); //recargar la lista de alarmas disponibles
  }

  void onSaveAlarm() {
    DateTime? scheduleAlarmDateTime;
    if (alarmTime!.isAfter(DateTime.now())) {
      scheduleAlarmDateTime = alarmTime;
    } else {
      scheduleAlarmDateTime = alarmTime!.add(const Duration(days: 1));
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: currentAlarms!.length,
      title: "Alarma Predeterminada",
    );
    _alarmHelper.insertAlarm(alarmInfo);

    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo,
          isRepeating: isRepeatSelected);
    }
    Get.back();
    loadAlarms();
  }

  void scheduleAlarm(DateTime scheduleAlarmDateTime, AlarmInfo alarmInfo,
      {required bool isRepeating}) async {
    //TODO: crear la notificacion local para que se indicar la creacion de la alarma de forma correcta
  }

  Future<void> updateModalAlarmClock(
    BuildContext context,
  ) async {
    var selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      DateTime selectedDateTime = DateTime(
          now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
      debugPrint("selectedDateTime: $selectedDateTime");
      alarmTime = selectedDateTime;
      alarmTimeString = DateFormat("HH:mm").format(selectedDateTime);
    }
    update();
  }

  void updateSwitch(bool value) {
    isRepeatSelected = value;
    update();
  }
}
