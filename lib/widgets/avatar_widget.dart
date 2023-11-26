import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height:MediaQuery.of(context).size.height *0.25 ,

        width: MediaQuery.of(context).size.width *0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/main_avatar.png'),
          ),
        ),
      ),
    );
  }
}
