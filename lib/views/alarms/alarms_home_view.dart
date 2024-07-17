import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/alarms_controller.dart';
import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/alarms_and_clock/buildMenuButton.dart';
import '../../widgets/drawer/drawer_menu.dart';

class AlarmsHomeView extends StatefulWidget {
  const AlarmsHomeView({super.key});

  @override
  State<AlarmsHomeView> createState() => _AlarmsHomeViewState();
}

class _AlarmsHomeViewState extends State<AlarmsHomeView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();
  final AlarmsController _alarmCtrl = Get.find<AlarmsController>();
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
          "Alarmas y Temporizadores",
          style: TextStyle(
            fontSize: responsive.dp(2),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (AlarmsController ctrl) {
          return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ctrl.menuItems
                    .map((currentMenuInfo) => BuildMenuButton(
                          currentMenuInfo: currentMenuInfo,
                          alarmCtrl: ctrl,
                        ))
                    .toList(),
              ),
              const VerticalDivider(
                color: Colors.grey,
                width: 1,
              ),
              Expanded(
                child: ctrl.setView(),
              ),
            ],
          );
        },
      ),
    );
  }
}
