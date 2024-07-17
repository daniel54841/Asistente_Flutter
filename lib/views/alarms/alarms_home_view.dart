import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/alarms_controller.dart';
import '../../controllers/voice_controller.dart';
import '../../net/data/menu_info.dart';
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
          "Calendario",
          style: TextStyle(
            fontSize: responsive.dp(2),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _alarmCtrl.menuItems
                .map((currentMenuInfo) => BuildMenuButton(
                      currentMenuInfo: currentMenuInfo,
                    ))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock)
                  return ClockView();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else
                  return Text(
                    value.title!,
                    style: TextStyle(fontSize: 20),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
