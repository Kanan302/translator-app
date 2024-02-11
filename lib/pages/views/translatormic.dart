import 'package:flutter/material.dart';

class TranslatorMic extends StatefulWidget {
  const TranslatorMic({super.key});

  @override
  State<TranslatorMic> createState() => _TranslatorMicState();
}

class _TranslatorMicState extends State<TranslatorMic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('microphone')),
    );
  }
}
