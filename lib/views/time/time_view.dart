import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/time_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/drawer/drawer_menu.dart';
import '../../widgets/floatingbutton/voice_floating_button.dart';

class TimeView extends StatelessWidget {
   TimeView({super.key});


  final TimeController _timeCtrl = Get.find<TimeController>();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Theme.of(context).splashColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).splashColor,
          title: Text(
            "El Tiempo",
            style: TextStyle(
              fontSize: responsive.dp(5),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [Text("Mapa")],
        ),
        floatingActionButton: const VoiceFloatingButton());
  }
}
