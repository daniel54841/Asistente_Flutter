import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/widgets/calendar/custom_calendar.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_menu.dart';

import '../../controllers/calendar_controller.dart';
import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/floatingbutton/voice_floating_button.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();
  final CalendarController _calendarCtrl = Get.find<CalendarController>();
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          "Calendario",
          style: TextStyle(
            fontSize: responsive.dp(2),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomCalendar(),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _calendarCtrl.createEvent();
            },
            heroTag: null,
            child: const Icon(
              Icons.event_note_sharp,
            ),
          ),
          SizedBox(
            height: responsive.dp(1.5),
          ),
          const VoiceFloatingButton()
        ],
      ),
    );
  }
}
