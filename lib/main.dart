import 'package:cybertize_admin/login.dart';
import 'package:cybertize_admin/splash.dart';
import 'package:cybertize_admin/util/storage.dart';
import 'package:flutter/material.dart';

import 'all_enquies.dart';
import 'navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
