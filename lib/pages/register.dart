import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator_app/bloc/eyes_bloc.dart';
import 'package:translator_app/core/constants/routes.dart';
import 'package:translator_app/widgets/widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  bool isObscuredPassword = true;
  bool isObscuredConfirmPassword = true;

  Future<void> toHome() async {
    await Firebase.initializeApp();
    final email = emailTextController.text;
    final password = passwordTextController.text;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
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
                    'Welcome! Create a new account.',
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
                          controller: emailTextController,
                          obscureText: false,
                          prefixIcon: Icons.email_outlined,
                          onPressed: null),
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
                            isObscuredPassword = state.selected;
                          }
                          return AppTextField(
                              hintText: 'Enter your password',
                              controller: passwordTextController,
                              obscureText: isObscuredPassword,
                              prefixIcon: Icons.lock_outline,
                              onPressed: () => context
                                  .read<EyesBloc>()
                                  .add(EyesVisibility()));
                        },
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
                          if (state is ConfirmEyesLoading) {
                            isObscuredConfirmPassword = state.selected;
                          }
                          return AppTextField(
                              hintText: 'Confirm your password',
                              controller: confirmPasswordTextController,
                              obscureText: isObscuredConfirmPassword,
                              prefixIcon: Icons.lock_outline,
                              onPressed: () => context
                                  .read<EyesBloc>()
                                  .add(ConfirmVisibility()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AppButton(
                    text: 'SIGN UP',
                    ontap: () {
                      if (passwordTextController.text !=
                              confirmPasswordTextController.text ||
                          !emailTextController.text.contains("@gmail.com")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password must be minimum of 6 characters and write correct email please'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        toHome();
                      }
                    },
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 14)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.login.path);
                        },
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
            ),
          ),
        ),
      ),
    );
  }
}
