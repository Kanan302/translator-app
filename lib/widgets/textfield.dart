import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData prefixIcon;
  final VoidCallback? onPressed;

  const AppTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.prefixIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Icon(prefixIcon),
        ),
        suffixIcon: onPressed != null
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onPressed,
                ),
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
      ),
      obscureText: obscureText,
      controller: controller,
      obscuringCharacter: obscureText ? '•' : ' ',
    );
  }
}
