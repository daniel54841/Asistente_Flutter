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
      return const ClockView();
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
    loadAlarms(); //recargar la lista de alarmas disponibles
  }

  void onSaveAlarm() {
    DateTime? scheduleAlarmDateTime;
    if (alarmTime!.isAfter(DateTime.now())) {
      scheduleAlarmDateTime = alarmTime;
    } else {
      scheduleAlarmDateTime = alarmTime!.add(Duration(days: 1));
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: currentAlarms!.length,
      title: "Alarma Predeterminada",
    );
    _alarmHelper.insertAlarm(alarmInfo);

    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo, isRepeating: isRepeatSelected);
    }
    Get.back();
    loadAlarms();
  }

  void scheduleAlarm(DateTime scheduleAlarmDateTime, AlarmInfo alarmInfo, {required bool isRepeating}) async {
    //TODO: crear la notificacion local para que se indicar la creacion de la alarma de forma correcta
  }

/*

                        DottedBorder(
                          strokeWidth: 2,
                          color: CustomColors.clockOutline,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(24),
                          dashPattern: [5, 4],
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomColors.clockBG,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            child: MaterialButton(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              onPressed: () {
                                _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
                                showModalBottomSheet(
                                  useRootNavigator: true,
                                  context: context,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          padding: const EdgeInsets.all(32),
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  var selectedTime = await showTimePicker(
                                                    context: context,
                                                    initialTime: TimeOfDay.now(),
                                                  );
                                                  if (selectedTime != null) {
                                                    final now = DateTime.now();
                                                    var selectedDateTime = DateTime(
                                                        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
                                                    _alarmTime = selectedDateTime;
                                                    setModalState(() {
                                                      _alarmTimeString = DateFormat('HH:mm').format(selectedDateTime);
                                                    });
                                                  }
                                                },
                                                child: Text(
                                                  _alarmTimeString,
                                                  style: TextStyle(fontSize: 32),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text('Repeat'),
                                                trailing: Switch(
                                                  onChanged: (value) {
                                                    setModalState(() {
                                                      _isRepeatSelected = value;
                                                    });
                                                  },
                                                  value: _isRepeatSelected,
                                                ),
                                              ),
                                              ListTile(
                                                title: Text('Sound'),
                                                trailing: Icon(Icons.arrow_forward_ios),
                                              ),
                                              ListTile(
                                                title: Text('Title'),
                                                trailing: Icon(Icons.arrow_forward_ios),
                                              ),
                                              FloatingActionButton.extended(
                                                onPressed: () {
                                                  onSaveAlarm(_isRepeatSelected);
                                                },
                                                icon: Icon(Icons.alarm),
                                                label: Text('Save'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                                // scheduleAlarm();
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/add_alarm.png',
                                    scale: 1.5,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Add Alarm',
                                    style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        Center(
                            child: Text(
                          'Only 5 alarms allowed!',
                          style: TextStyle(color: Colors.white),
                        )),
                    ]).toList(),
                  );
                }
                return Center(
                  child: Text(
                    'Loading..',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
       */
}
