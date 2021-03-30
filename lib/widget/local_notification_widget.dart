import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_notifications_app/local_notications_helper.dart';
import 'package:flutter_notifications_app/page/notification_page.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() => _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NotificationPage(payload: payload)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          title('Basics'),
          RaisedButton(
            child: Text('Show notification'),
            onPressed: () => showOngoingNotification(notifications,
                title: 'Notification Title', body: 'Notification Body: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
          RaisedButton(
            child: Text('Replace first notification'),
            onPressed: () => showOngoingNotification(notifications,
                title: 'Replaced Notification Title', body: 'Replaced Notification Body: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
          RaisedButton(
            child: Text('Other notification'),
            onPressed: () => showOngoingNotification(notifications,
                title: 'OtherTitle', body: 'OtherBody: Lorem ipsum dolor sit amet, consectetur adipiscing elit.', id: 20),
          ),
          const SizedBox(height: 32),


          title('Features'),
          RaisedButton(
            child: Text('Silent notification'),
            onPressed: () => showSilentNotification(notifications,
                title: 'SilentTitle', body: 'Silent Notification Body: Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', id: 30),
          ),



          const SizedBox(height: 32),
          title('Cancel'),
          RaisedButton(
            child: Text('Cancel all notification'),
            onPressed: notifications.cancelAll,
          ),
        ],
      ),
    );
  }

  Widget title(String text) => Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
      textAlign: TextAlign.center,
    ),
  );
}
