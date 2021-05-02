import 'package:BeTheHero/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Be The Hero",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
