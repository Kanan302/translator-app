import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'dart:async';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("From",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 120,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedvalue,
                              items: languages.map((lang) {
                                return DropdownMenuItem(
                                    value: lang,
                                    child: Text(lang!),
                                    onTap: () {
                                      if (from == languages[0]) {
                                        lang == languagecodes[0];
                                      } else if (from == languages[1]) {
                                        lang == languagecodes[1];
                                      } else if (from == languages[2]) {
                                        lang == languagecodes[2];
                                      } else if (from == languages[3]) {
                                        lang == languagecodes[3];
                                      } else if (from == languages[4]) {
                                        lang == languagecodes[4];
                                      } else if (from == languages[5]) {
                                        lang == languagecodes[5];
                                      } else if (from == languages[6]) {
                                        lang == languagecodes[6];
                                      } else if (from == languages[7]) {
                                        lang == languagecodes[7];
                                      }
                                      setState(() {});
                                    });
                              }).toList(),
                              onChanged: (value) {
                                selectedvalue = value!;
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        controller: textController,
                        maxLines: null,
                        minLines: null,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: swapLanguages,
                      icon: const Icon(Icons.swap_vert_circle_outlined)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("To",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 120,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: nextselectedvalue,
                              items: languages.map((lang) {
                                return DropdownMenuItem(
                                    value: lang,
                                    child: Text(lang!),
                                    onTap: () {
                                      if (to == languages[0]) {
                                        lang == languagecodes[0];
                                      } else if (to == languages[1]) {
                                        lang == languagecodes[1];
                                      } else if (to == languages[2]) {
                                        lang == languagecodes[2];
                                      } else if (to == languages[3]) {
                                        lang == languagecodes[3];
                                      } else if (to == languages[4]) {
                                        lang == languagecodes[4];
                                      } else if (to == languages[5]) {
                                        lang == languagecodes[5];
                                      } else if (to == languages[6]) {
                                        lang == languagecodes[6];
                                      } else if (to == languages[7]) {
                                        lang == languagecodes[7];
                                      }
                                      setState(() {});
                                    });
                              }).toList(),
                              onChanged: (value) {
                                nextselectedvalue = value!;
                              }),
                        ),
                      ],
                    ),
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
// onPressed: () => speak(textController.text),