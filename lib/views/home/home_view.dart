import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';
import 'package:reproductor_ia/widgets/floatingbutton/voice_floating_button.dart';
import 'package:reproductor_ia/widgets/item_list_views/buy_item.dart';

import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/drawer/drawer_menu.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();
  @override
  void initState() {
    _voiceCtrl.initSpeech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Theme.of(context).splashColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).splashColor,
          title: Text(
            HomeConstants.titleHome,
            style: TextStyle(
              fontSize: responsive.dp(5),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return BuyItem();
              },
              itemCount: 2,
            )
          ],
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.add,
              ),
            ),
            SizedBox(
              height: responsive.dp(1.5),
            ),
            const VoiceFloatingButton()
          ],
        ));
  }
}
