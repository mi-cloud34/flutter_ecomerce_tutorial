import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
 final Color? color;
  const CustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,style:TextStyle(color: color==null?Colors.white:Colors.black)),
      style: ElevatedButton.styleFrom(maximumSize: Size(double.infinity, 50),
      primary: color
      ),
    );
  }
}
