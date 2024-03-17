import 'package:flutter/material.dart';

class AppFirstContainer extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;

  const AppFirstContainer(
      {super.key, required this.controller, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0XFFD9D9D9),
          border: Border.all(color: Colors.black, width: 2)),
      child: Form(
        key: formkey,
        child: TextFormField(
          controller: controller,
          maxLines: null,
          minLines: null,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(border: InputBorder.none),
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AppSecondContainer extends StatelessWidget {
  final String text;
  const AppSecondContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0XFFD9D9D9),
      ),
      child: Center(
        child: SelectableText(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
