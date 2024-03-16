import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function ontap;

  const AppButton({required this.text, super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF1E232C)),
        ),
        onPressed: () {
          ontap();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15),
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
          borderSide: BorderSide(color: Color.fromARGB(197, 101, 94, 94)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(197, 101, 94, 94)),
        ),
      ),
      obscureText: obscureText,
      controller: controller,
      obscuringCharacter: obscureText ? '•' : ' ',
    );
  }
}
