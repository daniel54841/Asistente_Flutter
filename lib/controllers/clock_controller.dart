import 'package:get/get.dart';

class ClockController extends GetxController {
  DateTime now = DateTime.now();

  //var formattedDate = DateFormat('EEE, d MMM').format(now);
  //  var timezoneString = now.timeZoneOffset.toString().split('.').first;
  var offsetSign = '';
}
