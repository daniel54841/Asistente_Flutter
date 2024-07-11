import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';

import '../../utils/responsive.dart';

class BuyItem extends StatelessWidget {
  const BuyItem({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("/detail_list");
        },
        child: Card(
          color: Colors.grey,
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Titulo"),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FAProgressBar(
                        backgroundColor: Colors.blueGrey,
                        size: responsive.dp(5),
                        displayText: "/15",
                        displayTextStyle: TextStyle(color: Colors.black),
                        changeColorValue: 2,
                        currentValue: 1, //valor que progresa
                        changeProgressColor: Colors.lightGreenAccent,
                        maxValue: 15, //maximo valor que puede progresar
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text("Renombrar"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Borrar"),
                          value: 2,
                        )
                      ];
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
