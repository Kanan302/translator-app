import 'package:flutter/material.dart';

class AppDropDownMenu extends StatelessWidget {
  final List<String?> languages;
  final String selectedValue;
  final Function(String) onChanged;
  final Color gradientColor1;
  final Color gradientColor2;

  const AppDropDownMenu({
    super.key,
    required this.languages,
    required this.selectedValue,
    required this.onChanged,
    required this.gradientColor1,
    required this.gradientColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [gradientColor1, gradientColor2],
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: selectedValue,
          focusColor: Colors.white,
          items: languages.map((lang) {
            return DropdownMenuItem(
              value: lang,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(lang!),
              ),
              onTap: () {
                onChanged(lang);
              },
            );
          }).toList(),
          onChanged: (value) {
            onChanged(value.toString());
          },
        ),
      ),
    );
  }
}
