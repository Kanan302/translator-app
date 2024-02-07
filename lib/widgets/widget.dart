import 'package:flutter/material.dart';

// ignore_for_file: library_private_types_in_public_api
class AppTextField extends StatefulWidget {
  final String text;
  final IconData prefixicon;
  final bool isPasswordType;
  final IconData? suffixicon;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    Key? key,
    required this.text,
    required this.prefixicon,
    required this.isPasswordType,
    this.suffixicon,
    this.validator,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(fontSize: 18, color: Color(0xFF8391A1)),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            widget.prefixicon,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: widget.suffixicon != null
              ? IconButton(
                  icon: Icon(widget.suffixicon),
                  onPressed: () {
                    _toggleObscureText();
                  },
                )
              : null,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color.fromARGB(197, 101, 94, 94)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color.fromARGB(197, 101, 94, 94)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      obscureText: widget.isPasswordType ? _isObscured : false,
      obscuringCharacter: '*',
      validator: widget.validator,
    );
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}

class AppButton extends StatefulWidget {
  final String text;

  const AppButton({required this.text, super.key});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF1E232C)),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 55)),
      ),
      onPressed: () {},
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
