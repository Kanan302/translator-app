import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator_app/bloc/eyes_bloc.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

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
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushNamed(context, Routes.home.path))
        .onError((error, stackTrace) => "Error ${error.toString()}");
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'Welcome back! Glad to see you, Again!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextField(
                          hintText: 'Enter your email',
                          controller: emailController,
                          obscureText: false,
                          prefixIcon: Icons.email_outlined,
                          onPressed: null,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<EyesBloc, EyesState>(
                          builder: (context, state) {
                            if (state is EyesLoading) {
                              isObscured = state.selected;
                            }
                            return AppTextField(
                                hintText: 'Enter your password',
                                controller: passwordController,
                                obscureText: isObscured,
                                prefixIcon: Icons.lock_outline,
                                onPressed: () => context
                                    .read<EyesBloc>()
                                    .add(EyesVisibility()));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    AppButton(
                      text: 'LOG IN',
                      ontap: () {
                        if (emailController.text.isEmpty ||
                            !emailController.text.contains('@gmail.com')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please enter correct email or password'),
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
                        Text("Don't have an account? ",
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14)),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
