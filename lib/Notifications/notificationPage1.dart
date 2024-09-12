import 'package:flutter/material.dart';
import 'package:homie/NavBar.dart';
import 'package:homie/Notifications/messages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Page',
      home: const NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationService _notificationService = NotificationService();
  final List<Map<String, dynamic>> notifications = [
  {
  'profileImage': 'assets/profile1.jpg',
  'name': 'Hotel A',
  'hint': 'Your booking at Hotel A has been confirmed.',
  'messages': 5,
  'time': '2h ago',
  },
  {
  'profileImage': 'assets/profile2.jpg',
  'name': 'Hotel B',
  'hint': 'Special offer: 20% off on your next stay at Hotel B!',
  'messages': 3,
  'time': '4h ago',
  },
  {
  'profileImage': 'assets/profile3.jpg',
  'name': 'Hotel C',
  'hint': 'Your payment for Hotel C has been received.',
  'messages': 1,
  'time': '1d ago',
  },
  {
  'profileImage': 'assets/profile4.jpg',
  'name': 'Hotel D',
  'hint': 'Reminder: Your stay at Hotel D starts tomorrow.',
  'messages': 2,
  'time': '3d ago',
  },
  ];

  @override
  void initState() {
    super.initState();
    _notificationService.initialize();
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _notificationService.showNotification(message);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Column(
      children: [
  Text(
    'Notifications',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
    Padding(
      padding: const EdgeInsets.only(right: 25.0, top: 15),
      child: Text(
          'Recent Notifications',
              style: TextStyle(
                fontSize: 15,
              ),
      ),
    ),
    ],
  ),
    toolbarHeight: 100,
  ),
  body:ListView.builder(
    itemCount: notifications.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(notifications[index]['profileImage']),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notifications[index]['name']),
            Text(notifications[index]['hint']),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${notifications[index]['messages']} messages'),
            Text(notifications[index]['time']),
          ],
        ),
        isThreeLine: true,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePage(
                profileImage: notifications[index]['profileImage'],
                name: notifications[index]['name'],
              ),
            ),
          );
        },
      );
    },
  ),

  bottomNavigationBar: Navbar(),

    );

  }
}

