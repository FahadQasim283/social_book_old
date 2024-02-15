import 'package:flutter/material.dart';
import 'package:social_book/Constants/Colors/colors.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback ontap;
  final IconData? icon;
  final Color? color;

  const MyIconButton({super.key,this.color, required this.ontap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50)),
          child: Icon(icon!,color: Colors.white),
        ));
  }
}

class MyTextButton extends StatelessWidget {
  final VoidCallback ontap;
  final FontWeight fontWeight;
  final String? text;
  final Color? color;
  const MyTextButton(
      {super.key,
      required this.ontap,
      this.text,
      this.fontWeight = FontWeight.normal,
      this.color = MyColors.richCalculatorInnerButtonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              text!,
              style: TextStyle(fontWeight: fontWeight, color: Colors.white),
            )),
          ),
        ));
  }
}
