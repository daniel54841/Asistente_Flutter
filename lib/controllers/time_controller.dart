import 'package:get/get.dart';
import 'package:reproductor_ia/net/time/time_api.dart';

import '../net/data/time_models/Time.dart';

class TimeController extends GetxController {



  late Time? initTime;

  @override
  void onInit() {
    TimeApi.getTime("52.52", "13.41").then((value) {
      initTime = value;
    },);
    super.onInit();
  }







}
