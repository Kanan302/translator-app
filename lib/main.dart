import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/pages/login.dart';
import 'package:translator_app/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash.path,
      routes: {
        Routes.splash.path: (context) => const SplashPage(),
        Routes.login.path: (context) => const LoginPage(),
      },
    );
  }
}
