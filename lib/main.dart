import 'package:flutter/material.dart';
import 'package:translator_app/bloc/eyes_bloc.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/firebase_options.dart';
import 'package:translator_app/pages/homepage.dart';
import 'package:translator_app/pages/login.dart';
import 'package:translator_app/pages/register.dart';
import 'package:translator_app/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: avoid_print
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final eyesBloc = EyesBloc();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eyesBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash.path,
        routes: {
          Routes.splash.path: (context) => const SplashPage(),
          Routes.login.path: (context) => const LoginPage(),
          Routes.register.path: (context) => const RegisterPage(),
          Routes.home.path: (context) => const HomePage(),
        },
      ),
    );
  }
}
