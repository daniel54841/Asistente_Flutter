import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../../widgets/drawer/drawer_menu.dart';
import '../../widgets/floatingbutton/voice_floating_button.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Theme.of(context).splashColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).splashColor,
          title: Text(
            "Mapa",
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
