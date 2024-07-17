import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    MenuInfo(MenuType.clock, title: 'Reloj', imageSource: 'assets/alarms_timer/clock_icon.png'),
    MenuInfo(MenuType.alarm, title: 'Alarmas', imageSource: 'assets/alarms_timer/alarm_icon.png'),
    MenuInfo(MenuType.timer, title: 'Temporizador', imageSource: 'assets/alarms_timer/timer_icon.png'),
    MenuInfo(MenuType.stopwatch, title: 'Cronometro', imageSource: 'assets/alarms_timer/stopwatch_icon.png'),
  ];

  late Future<List<AlarmInfo>> alarms;

  @override
  void onInit() {
    alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      debugPrint("Database Inicializada de forma correccta");
      loadAlarms();
    });
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
      return const ClockView();
    } else if (menuType == MenuType.alarm) {
      return const AlarmView();
    } else {
      return const Center(
        child: Text("Pendiente de implementar"),
      );
    }
  }
}
