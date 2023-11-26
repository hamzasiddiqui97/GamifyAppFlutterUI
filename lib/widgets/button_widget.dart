import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  CustomButtonWidget({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.08,
      height: 60,
      width: MediaQuery.of(context).size.width * 0.70,

      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0), // Adjust padding as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
          ),
        ),
        child: Text(
          buttonText,
          style: textStyle ?? const TextStyle(color: Colors.black), // Default text style
        ),
      ),
    );
  }
}
