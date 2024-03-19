import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/widgets/button.dart';
import 'package:translator_app/widgets/container.dart';
import 'package:translator_app/widgets/dropdown.dart';

class TranslatorWrite extends StatefulWidget {
  const TranslatorWrite({super.key});

  @override
  State<TranslatorWrite> createState() => _TranslatorWriteState();
}

class _TranslatorWriteState extends State<TranslatorWrite> {
  final translator = GoogleTranslator();
  final formkey = GlobalKey<FormState>();

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

  String selectedvalue = 'English';
  String nextselectedvalue = 'Azerbaijani';
  String from = 'en';
  String to = 'az';
  TextEditingController textcontroller =
      TextEditingController(text: 'Hello World!');
  String data = "Salam Dünya!";

  void swapLanguages() {
    String temp = from;
    from = to;
    to = temp;

    String tempValue = selectedvalue;
    selectedvalue = nextselectedvalue;
    nextselectedvalue = tempValue;

    String tempText = textcontroller.text;
    textcontroller.text = data;
    data = tempText;
  }

  Future<void> translate() async {
    if (formkey.currentState!.validate()) {
      await translator
          .translate(textcontroller.text, from: from, to: to)
          .then((value) {
        data = value.text;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    textcontroller.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                AppFirstContainer(controller: textcontroller, formkey: formkey),
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
                AppSecondContainer(text: data),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  text: "Translate",
                  ontap: translate,
                  buttonColor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
