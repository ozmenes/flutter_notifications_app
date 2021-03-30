import 'package:flutter/material.dart';
import 'package:flutter_notifications_app/widget/local_notification_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'Local Notifications App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(appTitle: appTitle),
    );
  }
}

class Home extends StatelessWidget {
  final String appTitle;
  const Home({this.appTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LocalNotificationWidget(),
        ),
      ),
    );
  }
}
