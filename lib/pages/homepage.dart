import 'package:flutter/material.dart';
import 'package:translator_app/pages/views/nav_bar.dart';
import 'package:translator_app/pages/views/translatorgal.dart';
import 'package:translator_app/pages/views/translatormic.dart';
import 'package:translator_app/pages/views/translatorwrite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectindex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  final List<Widget> _pages = [
    const TranslatorWrite(),
    const TranslatorMic(),
    const TranslatorGallery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      bottomNavigationBar: NavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectindex],
    );
  }
}
