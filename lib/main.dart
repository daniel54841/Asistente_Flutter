import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/login_controller.dart';
import 'package:reproductor_ia/controllers/voice_controller.dart';
import 'package:reproductor_ia/utils/routes/custom_routes.dart';

Future<void> main() async {
  Get.put(LoginController());
  Get.put(VoiceController());
  //Firebase inicializacion
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/whassap_contact",
      getPages: CustomRoutes.getListRoutes(),
    );
  }
}
