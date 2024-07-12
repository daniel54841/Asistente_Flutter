import 'package:flutter/material.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_menu.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/responsive.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
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
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
