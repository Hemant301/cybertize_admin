import 'package:cybertize_admin/util/userCred.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (userCred.isUserLogin()) {
        Navigator.of(context).pushReplacementNamed(
          '/navbar',
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          '/login',
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "assets/logo-inverted-new.png",
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ]),
    );
  }
}
