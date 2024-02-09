// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

// ignore_for_file: avoid_print
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _tologin() {
    Navigator.pushNamed(context, Routes.login.path);
  }

  void _tohome() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((userCredential) {
      Navigator.pushNamed(context, Routes.home.path);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    });
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
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'lib/core/assets/worldmap.jpg',
                  height: 230,
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 13, bottom: 8),
                  child: Text(
                    'Welcome! Create a new account.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
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
                        prefixicon: Icons.lock_outline,
                        isPasswordType: true,
                        controller: _passwordController,
                        suffixicon: Icons.remove_red_eye_outlined,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      AppTextField(
                        text: 'Confirm your password',
                        prefixicon: Icons.lock_outline,
                        isPasswordType: true,
                        controller: _passwordController,
                        suffixicon: Icons.remove_red_eye_outlined,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      AppButton(
                          text: 'Register',
                          ontap: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.length < 6) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    'Please enter correct email or password'),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              _tohome();
                            }
                          }),
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account? ',
                              style: TextStyle(
                                  color: Color(0xFF6A707C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          GestureDetector(
                            onTap: _tologin,
                            child: const Text('Sign in',
                                style: TextStyle(
                                    color: Color(0xFF1E232C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
