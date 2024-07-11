import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/login_controller.dart';
import 'package:reproductor_ia/controllers/settings_controller.dart';
import 'package:reproductor_ia/controllers/voice_controller.dart';
import 'package:reproductor_ia/utils/routes/custom_routes.dart';

void main() async {
  //Firebase inicializacion
  WidgetsFlutterBinding.ensureInitialized(); //Firebase.initializeApp();
  Get.put(LoginController());
  Get.put(SettingsController());
  Get.put(VoiceController());
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      getPages: CustomRoutes.getListRoutes(),
    );
  }
}
