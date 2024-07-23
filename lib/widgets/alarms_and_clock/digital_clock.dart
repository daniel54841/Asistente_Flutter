import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/clock_controller.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  final ClockController _clockCtrl = Get.find<ClockController>();

  @override
  void initState() {
    _clockCtrl.initTime();
    super.initState();
  }

  @override
  void dispose() {
    _clockCtrl.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ClockController controller) {
        return Text(
          controller.formattedTime,
          style: TextStyle(
              fontFamily: 'avenir',
              color: Theme.of(context).primaryColor,
              fontSize: 64),
        );
      },
    );
  }
}
