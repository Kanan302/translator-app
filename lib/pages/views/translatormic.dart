import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/widgets/container.dart';
import 'dart:async';

import 'package:translator_app/widgets/dropdown.dart';

class TranslatorMic extends StatefulWidget {
  const TranslatorMic({super.key});

  @override
  State<TranslatorMic> createState() => _TranslatorMicState();
}

class _TranslatorMicState extends State<TranslatorMic> {
  final flutterTTS = FlutterTts();
  final translator = GoogleTranslator();
  final textController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> speak(String text) async {
    if (formkey.currentState!.validate()) {
      await flutterTTS.setVolume(1);
      await flutterTTS.setSpeechRate(0.6);
      await flutterTTS.setPitch(0.7);
      await flutterTTS.speak(text);
    }
  }

  Future<void> translate() async {
    if (formkey.currentState!.validate()) {
      from = languagecodes[languages.indexOf(selectedvalue)];
      to = languagecodes[languages.indexOf(nextselectedvalue)];

      if (ttsLanguageCodes.containsKey(to)) {
        await flutterTTS.setLanguage(ttsLanguageCodes[to]!);
      }

      await translator
          .translate(textController.text, from: from, to: to)
          .then((value) {
        data = value.text;
        setState(() {});
        speak(data);
      });
    }
  }

  List<String?> languages = [
    'Azerbaijani',
    'English',
    'Russian',
    'Turkish',
    'Italian',
    'Spanish',
    'German',
    'French',
  ];

  List<String> languagecodes = ['az', 'en', 'ru', 'tr', 'it', 'es', 'de', 'fr'];

  Map<String, String> ttsLanguageCodes = {
    'az': 'az-AZ',
    'en': 'en-US',
    'ru': 'ru-RU',
    'tr': 'tr-TR',
    'it': 'it-IT',
    'es': 'es-ES',
    'de': 'de-DE',
    'fr': 'fr-FR',
  };

  String selectedvalue = 'English';
  String from = 'en';

  String nextselectedvalue = 'Azerbaijani';
  String to = 'az';

  String data = '';

  void swapLanguages() {
    String temp = from;
    from = to;
    to = temp;

    String tempValue = selectedvalue;
    selectedvalue = nextselectedvalue;
    nextselectedvalue = tempValue;

    String tempText = textController.text;
    textController.text = data;
    data = tempText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35),
                        child: const Text(
                          'FROM',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppDropDownMenu(
                        languages: languages,
                        selectedValue: selectedvalue,
                        gradientColor1: const Color.fromRGBO(231, 104, 167, 10),
                        gradientColor2: const Color.fromRGBO(98, 30, 162, 10),
                        onChanged: (value) {
                          setState(() {
                            selectedvalue = value;
                            from =
                                languagecodes[languages.indexOf(selectedvalue)];
                          });
                        },
                      ),
                    ],
                  ),
                  AppFirstContainer(
                      controller: textController, formkey: formkey),
                  IconButton(
                      onPressed: swapLanguages,
                      icon: const Icon(Icons.swap_vert_circle_outlined)),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35),
                        child: const Text(
                          'TO',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppDropDownMenu(
                        languages: languages,
                        selectedValue: nextselectedvalue,
                        gradientColor1: const Color.fromRGBO(177, 43, 80, 10),
                        gradientColor2: const Color.fromRGBO(218, 141, 86, 10),
                        onChanged: (value) {
                          setState(() {
                            nextselectedvalue = value;
                            to = languagecodes[
                                languages.indexOf(nextselectedvalue)];
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  IconButton(
                      onPressed: translate,
                      icon: const Icon(Icons.volume_up_rounded)),
                ],
              )),
        ),
      ),
    );
  }
}
