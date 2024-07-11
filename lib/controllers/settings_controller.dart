import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:text_to_speech/text_to_speech.dart';

class SettingsController extends GetxController {
  double volume = 1;
  double rate = 1.0;
  double pitch = 1.0;
  TextToSpeech tts = TextToSpeech();
  List<String> languageCodes = <String>[];
  List<String> languages = <String>[];
  String? language;
  String? languageCode;
  final String defaultLanguage = 'en-US';
  String? voice;

  Future<void> initLanguages() async {
    /// populate lang code (i.e. en-US)
    languageCodes = await tts.getLanguages();

    /// populate displayed language (i.e. English)
    final List<String>? displayLanguages = await tts.getDisplayLanguages();
    if (displayLanguages == null) {
      return;
    }

    languages.clear();
    for (final dynamic lang in displayLanguages) {
      languages.add(lang as String);
    }

    final String? defaultLangCode = await tts.getDefaultLanguage();
    if (defaultLangCode != null && languageCodes.contains(defaultLangCode)) {
      languageCode = defaultLangCode;
    } else {
      languageCode = defaultLanguage;
    }
    language = await tts.getDisplayLanguageByCode(languageCode!);

    /// get voice
    voice = await getVoiceByLang(languageCode!);

    update();
  }

  Future<String?> getVoiceByLang(String lang) async {
    final List<String>? voices = await tts.getVoiceByLang(languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }

  void speak() {
    tts.setVolume(volume);
    tts.setRate(rate);
    if (languageCode != null) {
      tts.setLanguage(languageCode!);
    }
    tts.setPitch(pitch);
    tts.speak("Buenos dias, esto es una prueba de configuración. Me llamo Jarvis y soy su asistente. En que puedo ayudarle?");
  }

  setVolumeLanguage(double value) {
    volume = value;
    update();
  }

  setRatio(double value) {
    rate = value;
    update();
  }

  setPitch(double value) {
    pitch = value;
    update();
  }
}
