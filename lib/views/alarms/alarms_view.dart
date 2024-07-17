import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';

import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/drawer/drawer_menu.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();

  @override
  void initState() {
    _voiceCtrl.initSpeech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).splashColor,
          title: Text(
            "Calendario",
            style: TextStyle(
              fontSize: responsive.dp(2),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm at 23:59',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  FlutterAlarmClock.createAlarm(hour: 23, minutes: 59);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showAlarms,
                child: Text(
                  'Show alarms',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create timer for 42 seconds',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  FlutterAlarmClock.createTimer(length: 42);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showTimers,
                child: Text(
                  'Show Timers',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
