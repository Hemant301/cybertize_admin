import 'dart:io';

import 'package:cybertize_admin/login.dart';
import 'package:cybertize_admin/notify.dart';
import 'package:cybertize_admin/splash.dart';
import 'package:cybertize_admin/util/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';
import 'all_enquies.dart';
import 'navbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // final RemoteMessage? remoteMessage =
  //     await FirebaseMessaging.instance.getInitialMessage();
  // if (remoteMessage != null) {
  //   if (remoteMessage.data['notification_type'].toString() == "1") {
  //     Future.delayed(const Duration(seconds: 1), () {
  //       Navigator.pushReplacementNamed(
  //           MyApp.navigatorKey.currentState!.context, '/gest_app_detail',
  //           arguments: {
  //             'id': remoteMessage.data['user_id'],
  //             'name': "",
  //             'phone': ""
  //           });
  //     });
  //   }
  // }
  FirebaseMessaging.onMessage.listen((event) async {
    // {HEADER: head, body: body, message: title, intent-type: HOME, type: TEXT, id: inte}

    print('${event.data}----------------------');

    showThisNotification(event.data);
  });
  FirebaseMessaging.instance.subscribeToTopic('news');

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ('/splash'),
        routes: {
          "/splash": (context) => const SplashScreen(),
          "/navbar": (context) => Nav(),
          "/all_enquies": (context) => const AllEnquiry(),
          "/login": (context) => const LoginScreen(),
          // "/new": (context) => const New(),
        });
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'rgc_admin1', // id
  'rgc_admin', // title
  importance: Importance.max,

  playSound: true,
  sound: RawResourceAndroidNotificationSound('notification'),
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid) PathProviderAndroid.registerWith();
  if (Platform.isIOS) PathProviderIOS.registerWith();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');

  print(message.data);
  await FirebaseMessaging.instance.subscribeToTopic('news');

  showThisNotification(message.data);
}
