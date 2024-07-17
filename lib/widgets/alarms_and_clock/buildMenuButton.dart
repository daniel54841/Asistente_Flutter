import 'package:flutter/material.dart';

import '../../controllers/alarms_controller.dart';
import '../../net/data/menu_info.dart';

class BuildMenuButton extends StatelessWidget {
  final MenuInfo currentMenuInfo;
  final AlarmsController alarmCtrl;
  const BuildMenuButton({Key? key, required this.currentMenuInfo, required this.alarmCtrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0),
      color: Colors.grey,
      onPressed: () {
        alarmCtrl.updateMenuType(currentMenuInfo);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            currentMenuInfo.imageSource!,
            scale: 1.5,
          ),
          const SizedBox(height: 16),
          Text(
            currentMenuInfo.title ?? '',
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
