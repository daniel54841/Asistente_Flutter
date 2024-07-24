import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/alarms_controller.dart';
import '../../net/data/alarm_info.dart';
import '../../utils/theme.dart';
import '../../widgets/alarms_and_clock/alarm_card.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  final AlarmsController _ctrl = Get.find<AlarmsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarmas',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryTextColor,
                fontSize: 18),
          ),
          Expanded(
            child: GetBuilder(
              builder: (AlarmsController alarmsCtrl) {
                return FutureBuilder<List<AlarmInfo>>(
                  future: _ctrl.alarms,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<AlarmInfo>> snapshot) {
                    if (snapshot.hasData) {
                      _ctrl.currentAlarms = snapshot.data;
                      return ListView(
                        children: snapshot.data!.map<Widget>((alarm) {
                          var alarmTime = DateFormat('hh:mm aa')
                              .format(alarm.alarmDateTime!);
                          var gradientColor = GradientTemplate
                              .gradientTemplate[alarm.gradientColorIndex!]
                              .colors;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColor,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: gradientColor.last.withOpacity(0.4),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.label_important,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          alarm.title!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ), //titulo de la alarma e icono
                                    Switch(
                                      onChanged: (bool value) {},
                                      value: true,
                                      activeColor: Colors.white,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Lunes-Viernes",
                                  style: TextStyle(
                                      color: CustomColors.primaryTextColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      alarmTime,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.white,
                                        onPressed: () {
                                          alarmsCtrl.deleteAlarm(alarm.id);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).followedBy([
                          if (alarmsCtrl.currentAlarms!.length < 5)
                            DottedBorder(
                              strokeWidth: 2,
                              color: const Color(0xFFEAECFF),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(24),
                              dashPattern: const [5, 4],
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF444974),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                ),
                                child: AlarmCard(),
                              ),
                            )
                          else
                            const Center(
                              child: Text(
                                "Solo se puede crear 5 alarmas",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                        ]).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                            "Ha ocurrido un error inesperado. Por favor,intentelo más tarde"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
