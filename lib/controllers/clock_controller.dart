import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClockController extends GetxController {
  DateTime now = DateTime.now();
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  late Timer timer;
  var formattedDate;
  var offsetSign = '';

  @override
  void onInit() {
    super.onInit();
    formattedDate = DateFormat('EEEE, d ,MMMM').format(now);
  }

  void initTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var perviousMinute =
          DateTime.now().add(const Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute) {
        formattedTime = DateFormat('HH:mm').format(DateTime.now());
      }
    });
  }
}
