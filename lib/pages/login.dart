import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator_app/bloc/eyes_bloc.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

// ignore_for_file: avoid_print
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void toRegister() {
    Navigator.pushNamed(context, Routes.register.path);
  }

  Future<void> toHome() async {
    await Firebase.initializeApp();
    final email = emailController.text;
    final password = passwordController.text;
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushNamed(context, Routes.home.path))
        .onError((error, stackTrace) => print("Error ${error.toString()}"));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscured = true;

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
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                          fontSize: 18, color: Color(0xFF8391A1)),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(197, 101, 94, 94)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(197, 101, 94, 94)),
                      ),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  BlocBuilder<EyesBloc, EyesState>(
                    builder: (context, state) {
                      if (state is EyesLoading) {
                        isObscured = state.selected;
                      }
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Color(0xFF8391A1)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: IconButton(
                              icon: Icon(isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                context.read<EyesBloc>().add(EyesVisibility());
                              },
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(197, 101, 94, 94)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(197, 101, 94, 94)),
                          ),
                        ),
                        obscureText: isObscured,
                        obscuringCharacter: '*',
                        controller: passwordController,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  AppButton(
                    text: 'Login',
                    ontap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter correct email or password'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        toHome();
                      }
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
                        onTap: toRegister,
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
