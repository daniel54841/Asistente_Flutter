import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatelessWidget {
  final String route;
  final IconData iconCard;
  final String titleRoute;
  const DrawerItem({
    Key? key,
    required this.route,
    required this.iconCard,
    required this.titleRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Icon(iconCard),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(titleRoute)
            ],
          ),
        ),
      ),
    );
  }
}
