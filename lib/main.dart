import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homie/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'your_firebase_options_file.dart';
import 'package:homie/All logins/login.dart';
import 'package:homie/intro_pages/OnBoardingScreen4.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:homie/Notifications/notification_service.dart';
import 'package:homie/Notifications/notificationPage1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     //options: DefaultFirebaseOptions.currentPlatform, //optional for cli initialization
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp( MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  //const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage());
  }


}
