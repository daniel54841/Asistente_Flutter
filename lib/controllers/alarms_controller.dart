import 'dart:async';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Map<String, int> alarmSettingMap = <String, int>{};

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

  late List<AlarmSettings> alarmSettings;

  @override
  void onInit() {
    alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase();
    debugPrint("Database Inicializada de forma correccta");

    if (Alarm.android) {
      checkAndroidNotificationPermission();
      checkAndroidScheduleExactAlarmPermission();
    }

    loadAlarms();

    super.onInit();
  }

  MenuType menuType = MenuType.clock;

  void loadAlarms() {
    alarms = _alarmHelper.getAlarms();
    update();
  }

  Future<void> checkAndroidNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      alarmPrint('Requesting notification permission...');
      final res = await Permission.notification.request();
      alarmPrint(
        'Notification permission ${res.isGranted ? '' : 'not '}granted',
      );
    }
  }

  Future<void> checkAndroidExternalStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      alarmPrint('Requesting external storage permission...');
      final res = await Permission.storage.request();
      alarmPrint(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    alarmPrint('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      alarmPrint('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      alarmPrint(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
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

  void onSaveAlarm(String title) {
    DateTime? scheduleAlarmDateTime;
    if (alarmTime!.isAfter(DateTime.now())) {
      scheduleAlarmDateTime = alarmTime;
    } else {
      scheduleAlarmDateTime = alarmTime!.add(const Duration(days: 1));
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: currentAlarms!.length,
      title: title != "" ? title : "Alarma Predeterminada",
    );
    _alarmHelper.insertAlarm(alarmInfo);

    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo,
          isRepeating: isRepeatSelected);
    }

    createAlarm(scheduleAlarmDateTime!, title);

    Get.back();

    loadAlarms();
  }

  void createAlarm(DateTime selectedDateTime, String title) {
    bool loopAudio = true;
    bool vibrate = true;
    double? volume = 1.0;
    String assetAudio = "assets/alarms_song/star_wars.mp3";
    int id = DateTime.now().millisecondsSinceEpoch % 10000 + 1;

    AlarmSettings alarmSetting = AlarmSettings(
      id: id,
      dateTime: selectedDateTime,
      loopAudio: loopAudio,
      vibrate: vibrate,
      volume: volume,
      assetAudioPath: assetAudio,
      notificationTitle: title,
      notificationBody: 'Your alarm ($id) is ringing',
      enableNotificationOnKill: Platform.isAndroid,
    );

    alarmSettingMap.addAll({title: id});

    Alarm.set(alarmSettings: alarmSetting);
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

  Future<void> stopAlarm() async {
    for (AlarmSettings setting in Alarm.getAlarms()) {
      if (await Alarm.isRinging(setting.id)) {
        debugPrint("Parando la alarma con el id: ${setting.id}");
        await Alarm.stop(setting.id);
      }
    }
  }

  Future<void> stopAllAlarms() async {
    await Alarm.stopAll();
  }
}
