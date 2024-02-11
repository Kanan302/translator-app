import 'package:flutter/material.dart';

class TranslatorCamera extends StatefulWidget {
  const TranslatorCamera({super.key});

  @override
  State<TranslatorCamera> createState() => _TranslatorCameraState();
}

class _TranslatorCameraState extends State<TranslatorCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('camera')),
    );
  }
}
