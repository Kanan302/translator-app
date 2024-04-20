import 'package:flutter/material.dart';
import 'package:translator_app/pages/views/translatorgal.dart';
import 'package:translator_app/pages/views/translatormic.dart';
import 'package:translator_app/pages/views/translatorwrite.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectindex = 0;

  final List<Widget> _pages = [
    const TranslatorWrite(),
    const TranslatorMic(),
    const TranslatorGallery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectindex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectindex = index;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: selectindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.text_format_outlined),
              label: 'Text',
              tooltip: 'Translate Text',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic_none_outlined),
              label: 'Voice',
              tooltip: 'Translate Text to Voice',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_library_outlined),
                label: 'Photos',
                tooltip: 'Translate Text from Photo'),
          ]),
    );
  }
}
