import 'package:auto_route/annotations.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';

@RoutePage()
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      drawer: const AppDrawer(),
      body: CellCalendar(),
    );
  }
}
