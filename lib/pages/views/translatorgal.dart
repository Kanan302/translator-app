import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/widgets/button.dart';
import 'package:translator_app/widgets/container.dart';
import 'package:translator_app/widgets/dropdown.dart';

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
        scannedText += "${line.text}\n";
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
      backgroundColor: Colors.grey.shade100,
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
                    color: Colors.grey.shade300,
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
                        backgroundColor: const Color(0xFF4E65FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.grey[600]),
                    onPressed: () {
                      getImage();
                    },
                    child: const SizedBox(
                      width: 50,
                      height: 60,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
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
                  buttonColor: const Color(0xFF3C00E5),
                ),
                const SizedBox(
                  height: 20,
                ),
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
