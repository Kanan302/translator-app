import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

class TranslatorMic extends StatefulWidget {
  const TranslatorMic({super.key});

  @override
  State<TranslatorMic> createState() => _TranslatorMicState();
}

class _TranslatorMicState extends State<TranslatorMic> {
  final flutterTTS = FlutterTts();
  final textController = TextEditingController();

  Future<void> speak(String text) async {
    await flutterTTS.setLanguage("en-US");
    await flutterTTS.setVolume(0.8);
    await flutterTTS.setSpeechRate(0.5);
    await flutterTTS.setPitch(1);
    await flutterTTS.speak(text);
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
                  TextFormField(
                    controller: textController,
                  ),
                  ElevatedButton(
                      onPressed: () => speak(textController.text),
                      child: const Text("Text to speak"))
                ],
              )),
        ),
      ),
    );
  }
}
