import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function ontap;
  final Color buttonColor;

  const AppButton(
      {required this.text,
      super.key,
      required this.ontap,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    Color textColor = buttonColor == Colors.black ? Colors.white : Colors.black;

    return SizedBox(
      width: 140,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: () {
          ontap();
        },
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

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
