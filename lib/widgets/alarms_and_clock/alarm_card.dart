import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reproductor_ia/controllers/alarms_controller.dart';

class AlarmCard extends StatelessWidget {
  AlarmCard({super.key});
  final AlarmsController _alarmCtrl = Get.find<AlarmsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: MaterialButton(
        child: const Text(
          "Añadir Alarma",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          _alarmCtrl.alarmTimeString =
              DateFormat("HH:mm").format(DateTime.now());
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            builder: (context) {
              return Column(
                children: [
                  GetBuilder(builder: (AlarmsController ctrl) {
                    return TextButton(
                      onPressed: () async {
                        _alarmCtrl.updateModalAlarmClock(context);
                      },
                      child: Text(ctrl.alarmTimeString),
                    );
                  }),
                  ListTile(
                    title: const Text("¿Repetir?"),
                    trailing: GetBuilder(builder: (AlarmsController ctrl) {
                      return Switch(
                        onChanged: (value) {
                          ctrl.updateSwitch(value);
                        },
                        value: ctrl.isRepeatSelected,
                      );
                    }),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      _alarmCtrl.onSaveAlarm();
                    },
                    icon: const Icon(Icons.alarm),
                    label: const Text(
                      'Guardar',
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
