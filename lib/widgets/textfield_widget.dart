import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {


  final String hintText;
  final IconData icon;
  final bool isObsecure;


  const TextFieldWidget({super.key, required this.hintText, required this.icon, required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      child: TextField(
        obscureText: isObsecure,
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: Colors.white,
            )),
      ),
    );
  }
}
