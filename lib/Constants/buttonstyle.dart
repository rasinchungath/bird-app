import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  StyledButton({
    super.key,
    required this.foreColor,
    required this.backColor,
    required this.buttonText,
    required void Function() buttonAction,
  });
  Color foreColor;
  Color backColor;
  String buttonText;
   void Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ButtonStyle(
        
        foregroundColor: MaterialStateProperty.all<Color>(foreColor),
        backgroundColor: MaterialStateProperty.all<Color>(backColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
