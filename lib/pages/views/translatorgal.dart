import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/widgets/widget.dart';

// ignore_for_file: avoid_print
// ignore_for_file: prefer_interpolation_to_compose_strings

class TranslatorGallery extends StatefulWidget {
  const TranslatorGallery({super.key});

  @override
  State<TranslatorGallery> createState() => _TranslatorGalleryState();
}

class _TranslatorGalleryState extends State<TranslatorGallery> {
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";
  String data = "";
  final translator = GoogleTranslator();

  List<String> languages = [
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

  String nextselectedvalue = 'Azerbaijani';
  String to = 'az';

  void getImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      setState(() {});
      scannedText = "Error something went wrong";
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText += line.text + "\n";
      }
    }

    textScanning = false;
    setState(() {});
  }

  Future<void> translate() async {
    await translator.translate(scannedText, from: 'auto', to: to).then((value) {
      data = value.text;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!textScanning && imageFile == null)
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[300],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.grey[600]),
                    onPressed: () {
                      getImage();
                    },
                    child: SizedBox(
                      width: 50,
                      height: 60,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.photo,
                            color: Colors.grey[700],
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: SelectableText(
                      scannedText,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'To',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: nextselectedvalue,
                            focusColor: Colors.white,
                            items: languages.map((lang) {
                              return DropdownMenuItem<String>(
                                value: lang,
                                child: Text(lang),
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
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: SelectableText(
                      data,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(text: "Translate", ontap: translate),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
