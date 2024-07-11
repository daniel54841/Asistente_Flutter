import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceController extends GetxController {
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    update();
  }

  //comenzar la escucha
  void startListening() async {
    lastWords = "";
    await speechToText.listen(onResult: _onSpeechResult);
    update();
  }

  //parar la escucha
  void stopListening() async {
    await speechToText.stop();
    update();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    update();
  }
}
