import 'package:flutter/material.dart';

class AppDropDownMenu extends StatelessWidget {
  final List<String?> languages;
  final String selectedValue;
  final Function(String) onChanged;
  final Color gradientColor1;
  final Color gradientColor2;

  final Map<String, String> languageFlags = {
    'Azerbaijani': 'lib/core/assets/az.png',
    'English': 'lib/core/assets/en.png',
    'Russian': 'lib/core/assets/ru.png',
    'Turkish': 'lib/core/assets/tr.png',
    'Italian': 'lib/core/assets/it.png',
    'Spanish': 'lib/core/assets/es.png',
    'German': 'lib/core/assets/de.png',
    'French': 'lib/core/assets/fr.png',
  };

  AppDropDownMenu({
    Key? key,
    required this.languages,
    required this.selectedValue,
    required this.onChanged,
    required this.gradientColor1,
    required this.gradientColor2,
  }) : super(key: key);

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang!),
                    const SizedBox(width: 8),
                    Image.asset(
                      languageFlags[lang]!,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
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
