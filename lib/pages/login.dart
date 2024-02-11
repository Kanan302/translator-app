// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

// ignore_for_file: avoid_print
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _toregister() {
    Navigator.pushNamed(context, Routes.register.path);
  }

  void _tohome() {
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(
    //         email: _emailController.text, password: _passwordController.text)
    //     .then((value) =>
    Navigator.pushNamed(context, Routes.home.path);
    // )
    // .onError((error, stackTrace) => print("Error ${error.toString()}"));
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Image.asset('lib/core/assets/worldmap.jpg'),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 13, bottom: 8),
                child: Text(
                  'Welcome back! Glad to see you, Again!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  AppTextField(
                    text: 'Enter your email',
                    prefixicon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  AppTextField(
                    text: 'Enter your password',
                    prefixicon: Icons.lock_outline_rounded,
                    isPasswordType: true,
                    suffixicon: Icons.remove_red_eye_outlined,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  AppButton(
                    text: 'Login',
                    ontap: () {
                      // if (_emailController.text.isEmpty ||
                      //     _passwordController.text.length < 6) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content:
                      //           Text('Please enter correct email or password'),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   );
                      // } else {
                      _tohome();
                      // }
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(
                              color: Color(0xFF6A707C),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      GestureDetector(
                        onTap: _toregister,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: Color(0xFF1E232C),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
