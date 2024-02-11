import 'package:flutter/material.dart';

class TranslatorWrite extends StatefulWidget {
  const TranslatorWrite({super.key});

  @override
  State<TranslatorWrite> createState() => _TranslatorWriteState();
}

class _TranslatorWriteState extends State<TranslatorWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('write')),
    );
  }
}
