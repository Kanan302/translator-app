import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/pages/homepage.dart';
import 'package:translator_app/pages/login.dart';
import 'package:translator_app/pages/register.dart';
import 'package:translator_app/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        Routes.register.path: (context) => const RegisterPage(),
        Routes.home.path: (context) => const HomePage()
      },
    );
  }
}
