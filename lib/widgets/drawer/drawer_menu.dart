import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_item.dart';

import '../../utils/assets_route.dart';
import '../../utils/responsive.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: responsive.dp(5.2), top: responsive.dp(2.2)),
                child: Lottie.asset(
                  AssetsRoute.animationPath("Jarvis_Animation"),
                  width: responsive.wp(35), //150
                  height: responsive.hp(22), //130
                  fit: BoxFit.cover,
                  repeat: false,
                  animate: true,
                ),
              ),
            ],
          ),
          const DrawerItem(
            route: "/home",
            iconCard: Icons.home,
            titleRoute: "Tareas y Alertas",
          ),
          const DrawerItem(
            route: "/contact",
            iconCard: Icons.contact_mail,
            titleRoute: "Contactos",
          ),
          const DrawerItem(
            route: "/calendar",
            iconCard: Icons.calendar_month,
            titleRoute: "Calendario",
          ),
          const DrawerItem(
            route: "/alarms",
            iconCard: Icons.alarm,
            titleRoute: "Alarmas y Reloj",
          ),
          const DrawerItem(
            route: "/map",
            iconCard: Icons.map,
            titleRoute: "El Tiempo",
          ),
          const DrawerItem(
            route: "/settings",
            iconCard: Icons.settings,
            titleRoute: "Configuración",
          ),
        ],
      ),
    );
  }
}
