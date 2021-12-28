import 'package:flutter/material.dart';
import 'notification_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    NotificationService.init();
    listenNotifications();
  }

  void listenNotifications() => NotificationService.onNotifications.listen(onClickedNotification);
  
  void onClickedNotification(String? payload) => print('Notification clicked!');

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => NotificationService.showNotification(
                    title: "Cześć UpWare!",
                    body: "To treść powiadomienia"
                  ),
                  child: Text('Send notification')),
            ]));

  }
}