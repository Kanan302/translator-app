import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;

  Future<void> toHome() async {
    await Firebase.initializeApp();
    final email = emailTextController.text;
    final password = passwordTextController.text;
    debugPrint('Email: $email');
    debugPrint('Password: $password');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'lib/core/assets/worldmap.jpg',
                  height: 230,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: Text(
                    'Welcome! Create a new account.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Color(0xFF8391A1)),
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
                  controller: emailTextController,
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Color(0xFF8391A1)),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Icon(
                        Icons.lock_outline,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: IconButton(
                        icon: Icon(
                          _isObscuredPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscuredPassword = !_isObscuredPassword;
                          });
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
                  obscureText: _isObscuredPassword,
                  obscuringCharacter: '*',
                  controller: passwordTextController,
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Color(0xFF8391A1)),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Icon(
                        Icons.lock_outline,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: IconButton(
                        icon: Icon(
                          _isObscuredConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscuredConfirmPassword =
                                !_isObscuredConfirmPassword;
                          });
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
                  obscureText: _isObscuredConfirmPassword,
                  obscuringCharacter: '*',
                  controller: confirmPasswordTextController,
                ),
                const SizedBox(
                  height: 17,
                ),
                AppButton(
                  text: 'Register',
                  ontap: () {
                    if (passwordTextController.text !=
                            confirmPasswordTextController.text ||
                        passwordTextController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Password must be minimum of 6 characters and match the confirmation password'),
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
                    const Text('Already have an account? ',
                        style: TextStyle(
                            color: Color(0xFF6A707C),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
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
    );
  }
}
