import 'package:get/get.dart';
import 'package:reproductor_ia/net/time/time_api.dart';

class TimeController extends GetxController {


  @override
  void onInit() {
    TimeApi.getTime("52.52", "13.41");
    super.onInit();
  }







}
