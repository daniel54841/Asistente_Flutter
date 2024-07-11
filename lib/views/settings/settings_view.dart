import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/settings_controller.dart';
import 'package:reproductor_ia/views/settings/jarvis_settings.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_menu.dart';

import '../../utils/responsive.dart';
import '../../widgets/item_list_views/settings_item_list.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsController _settingsCtrl = Get.find<SettingsController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _settingsCtrl.initLanguages();
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          "Configuración",
          style: TextStyle(
            fontSize: responsive.dp(5),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SettingsItemList(
            titleSection: "Configuración Jarvis",
            bodySection: [
              JarvisSettings(),
            ],
          )
        ],
      ),
    );
  }
}
