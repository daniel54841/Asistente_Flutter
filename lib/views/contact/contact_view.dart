import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder(
      builder: (VoiceController voice) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Speech Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Recognized words: ${voice.lastWords}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      // If listening is active show the recognized words
                      voice.speechToText.isListening
                          ? voice.lastWords
                          // If listening isn't active but could be tell the user
                          // how to start it, otherwise indicate that speech
                          // recognition is not yet ready or not supported on
                          // the target device
                          : voice.speechEnabled
                              ? 'Tap the microphone to start listening...'
                              : 'Speech not available',
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:
                // If not yet listening for speech start, otherwise stop
                voice.speechToText.isNotListening ? voice.startListening : voice.stopListening,
            tooltip: 'Listen',
            child: Icon(voice.speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          ),
        );
      },
    );
  }
}
