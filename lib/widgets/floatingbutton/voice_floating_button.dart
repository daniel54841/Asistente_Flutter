import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/voice_controller.dart';

class VoiceFloatingButton extends StatelessWidget {
  const VoiceFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (VoiceController voice) {
        return FloatingActionButton(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              voice.speechToText.isNotListening ? voice.startListening : voice.stopListening,
          tooltip: 'Listen',
          child: Icon(voice.speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        );
      },
    );
  }
}
