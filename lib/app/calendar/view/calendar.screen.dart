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
      body: CellCalendar(
        onPageChanged: (firstDate, lastDate) {
          print("This is the first date of the new page: $firstDate");
          print("This is the last date of the new page: $lastDate");
        },
        onCellTapped: (date) {
          _dialogBuilder(context, date);
        },
        events: [
          CalendarEvent(
              eventName: "Event 1",
              eventDate: DateTime(2024),
              eventTextStyle: TextStyle()),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, DateTime date) {
    print("$date is tapped !");
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('View date'),
          content: Text('Clicked date:\n' '${date}.'),
          // actions: <Widget>[
          //   TextButton(
          //     style: TextButton.styleFrom(
          //       textStyle: Theme.of(context).textTheme.labelLarge,
          //     ),
          //     child: const Text('Disable'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   TextButton(
          //     style: TextButton.styleFrom(
          //       textStyle: Theme.of(context).textTheme.labelLarge,
          //     ),
          //     child: const Text('Enable'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}
