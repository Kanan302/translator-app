import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore_for_file: must_be_immutable
class NavBar extends StatefulWidget {
  void Function(int)? onTabChange;
  NavBar({super.key, required this.onTabChange});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        color: Colors.black,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.black),
        tabs: const [
          GButton(
            icon: Icons.text_format_outlined,
            text: 'Text',
            textColor: Colors.black,
            gap: 3,
          ),
          GButton(
            icon: Icons.mic_none_outlined,
            text: 'Voice',
            textColor: Colors.black,
            gap: 3,
          ),
          GButton(
            icon: Icons.photo_library_outlined,
            text: 'Photos',
            textColor: Colors.black,
            gap: 3,
          ),
        ],
      ),
    );
  }
}
// camera_alt_outlined