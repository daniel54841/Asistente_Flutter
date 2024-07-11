import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings_controller.dart';

class JarvisSettings extends StatelessWidget {
  JarvisSettings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (SettingsController setting) {
        return Column(
          children: [
            //Volumen
            Row(
              children: <Widget>[
                const Text('Volumen'),
                Expanded(
                    child: Slider(
                  value: setting.volume,
                  min: 0,
                  max: 1,
                  label: setting.volume.round().toString(),
                  onChanged: (double value) {
                    setting.setVolumeLanguage(value);
                  },
                )),
                Text('(${setting.volume.toStringAsFixed(2)})'),
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Velocidad'),
                Expanded(
                    child: Slider(
                  value: setting.pitch,
                  min: 0,
                  max: 1,
                  label: setting.pitch.round().toString(),
                  onChanged: (double value) {
                    setting.setPitch(value);
                  },
                )),
                Text('(${setting.pitch.toStringAsFixed(2)})'),
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Agudeza'),
                Expanded(
                    child: Slider(
                  value: setting.rate,
                  min: 0,
                  max: 1,
                  label: setting.rate.round().toString(),
                  onChanged: (double value) {
                    setting.setRatio(value);
                  },
                )),
                Text('(${setting.rate.toStringAsFixed(2)})'),
              ],
            ),
            ElevatedButton(
              child: const Text('Test Speak'),
              onPressed: () {
                setting.speak(null);
              },
            ),
            //Rate

            /**
             *
             *
             */
          ],
        );
      },
    );
  }
}
