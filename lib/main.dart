import 'package:flutter/material.dart';
import 'package:schedule_notification/notification_service.dart';

void main() async {
  await NotificationService.initializeNotification();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  DateTime dateTime = DateTime(2023, 10, 12, 15, 57);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              print("date is ${dateTime.toLocal()}");
              await NotificationService.showNotification(
                title: "Scheduled Notification",
                body: "Notification was fired after 10 seconds",
                scheduleTime: dateTime,
              );
            },
            child: Text("${dateTime.toString()}"),
          ),
        ),
      ),
    );
  }
}
