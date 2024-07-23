import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/clock_controller.dart';

import '../../widgets/alarms_and_clock/digital_clock.dart';

class ClockView extends StatelessWidget {
  ClockView({Key? key}) : super(key: key);
  final ClockController _clockCtrl = Get.find<ClockController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 64,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text("Reloj",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    fontSize: 18)),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const DigitalClock(),
                Text(
                  _clockCtrl.formattedDate,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
