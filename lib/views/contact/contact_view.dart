import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/widgets/floatingbutton/voice_floating_button.dart';

import '../../controllers/voice_controller.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

/// An example that demonstrates the basic functionality of the
/// SpeechToText plugin for using the speech recognition capability
/// of the underlying platform.
class _ContactViewState extends State<ContactView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();

  @override
  void initState() {
    _voiceCtrl.initSpeech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*return GetBuilder(
      builder: (VoiceController voice) {*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body: const Center(child: Text("")),
      floatingActionButton: const VoiceFloatingButton(),
    );
    /*},
    );*/
  }
}
