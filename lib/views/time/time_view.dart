import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:reproductor_ia/controllers/time_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/drawer/drawer_menu.dart';
import '../../widgets/floatingbutton/voice_floating_button.dart';

class TimeView extends StatelessWidget {
   TimeView({super.key});


  final TimeController _timeCtrl = Get.find<TimeController>();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Theme.of(context).splashColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).splashColor,
          title: Text(
            "El Tiempo",
            style: TextStyle(
              fontSize: responsive.dp(2.5),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: FlutterLocationPicker(
            initPosition: LatLong(23, 89),
            selectLocationButtonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
            selectLocationButtonText: 'Set Current Location',
            selectLocationButtonLeadingIcon: const Icon(Icons.check),
            initZoom: 11,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            trackMyPosition: true,
            onError: (e) => print(e),
            onPicked: (pickedData) {
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
              print(pickedData.addressData['country']);
            },
            onChanged: (pickedData) {
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
              print(pickedData.addressData);
            }),

        floatingActionButton: const VoiceFloatingButton());
  }
}
