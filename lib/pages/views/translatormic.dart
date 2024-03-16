import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'dart:async';

import 'package:translator_app/widgets/widget.dart';

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
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(231, 104, 167, 10),
                              Color.fromRGBO(98, 30, 162, 10),
                            ],
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedvalue,
                            focusColor: Colors.white,
                            items: languages.map((lang) {
                              return DropdownMenuItem(
                                value: lang,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(lang!),
                                ),
                                onTap: () {
                                  if (lang == languages[0]) {
                                    from = languagecodes[0];
                                  } else if (lang == languages[1]) {
                                    from = languagecodes[1];
                                  } else if (lang == languages[2]) {
                                    from = languagecodes[2];
                                  } else if (lang == languages[3]) {
                                    from = languagecodes[3];
                                  } else if (lang == languages[4]) {
                                    from = languagecodes[4];
                                  } else if (lang == languages[5]) {
                                    from = languagecodes[5];
                                  } else if (lang == languages[6]) {
                                    from = languagecodes[6];
                                  } else if (lang == languages[7]) {
                                    from = languagecodes[7];
                                  }
                                  setState(() {});
                                },
                              );
                            }).toList(),
                            onChanged: (value) {
                              selectedvalue = value!;
                            },
                          ),
                        ),
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
                      Container(
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromRGBO(177, 43, 80, 10),
                                    Color.fromRGBO(218, 141, 86, 10),
                                  ])),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                isExpanded: true,
                                value: nextselectedvalue,
                                focusColor: Colors.white,
                                items: languages.map((lang) {
                                  return DropdownMenuItem(
                                    value: lang,
                                    child: Text(lang!),
                                    onTap: () {
                                      if (lang == languages[0]) {
                                        to = languagecodes[0];
                                      } else if (lang == languages[1]) {
                                        to = languagecodes[1];
                                      } else if (lang == languages[2]) {
                                        to = languagecodes[2];
                                      } else if (lang == languages[3]) {
                                        to = languagecodes[3];
                                      } else if (lang == languages[4]) {
                                        to = languagecodes[4];
                                      } else if (lang == languages[5]) {
                                        to = languagecodes[5];
                                      } else if (lang == languages[6]) {
                                        to = languagecodes[6];
                                      } else if (lang == languages[7]) {
                                        to = languagecodes[7];
                                      }
                                      setState(() {});
                                    },
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  nextselectedvalue = value!;
                                }),
                          )),
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
