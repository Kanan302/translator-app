import 'package:flutter/material.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _toregister() {
    Navigator.pushNamed(context, Routes.register.path);
  }

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
                child: Center(
                  child: Text(
                    'Welcome back! Glad to see you, Again!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const AppTextField(
                    text: 'Enter your email',
                    prefixicon: Icons.email_outlined,
                    isPasswordType: false,
                    suffixicon: null,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const AppTextField(
                    text: 'Enter your password',
                    prefixicon: Icons.lock_outline_rounded,
                    isPasswordType: true,
                    suffixicon: Icons.remove_red_eye_sharp,
                    // validator: (value) {
                    //   if (value!.isEmpty || value.length < 6) {
                    //     return "Enter correct password";
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const AppButton(text: 'Login'),
                  const SizedBox(
                    height: 13,
                  ),
                  Center(
                    child: Row(
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
                    ),
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
