import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/button.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFF2C3546)],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Translate Mate',
                      style: TextStyle(
                          color: Color(0xFF3B6DA9),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Your Translator Friend',
                      style: TextStyle(color: Color(0xFF928893), fontSize: 18),
                    ),
                  ],
                ),
                Image.asset(
                  'lib/core/assets/3dicons.png',
                  fit: BoxFit.contain,
                  height: 300,
                  width: 300,
                ),
                AppButton(
                    text: 'Click To Start',
                    ontap: () =>
                        Navigator.pushNamed(context, Routes.login.path),
                    buttonColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
