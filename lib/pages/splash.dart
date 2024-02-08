import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate(context);
  }

  void _navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, Routes.login.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/core/assets/splashphoto.jpg',
              fit: BoxFit.contain,
              height: 300,
            ),
            const Text(
              'Language Translator',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
