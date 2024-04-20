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
    Color textColor;
    if(buttonColor == const Color(0xFF3C00E5) || buttonColor == Colors.black){
      textColor =  Colors.white;
    }
    else{
      textColor =  Colors.black;
    }
  
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
