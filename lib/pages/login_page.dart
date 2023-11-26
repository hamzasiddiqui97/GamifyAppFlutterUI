import 'package:flutter/material.dart';
import 'package:gamify_app/widgets/avatar_widget.dart';
import 'package:gamify_app/widgets/button_widget.dart';
import 'package:gamify_app/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const AvatarWidget(),
          Column(
            children: [
              const TextFieldWidget(
                hintText: 'john@gmail.com',
                icon: Icons.mail_outline,
                isObsecure: false,
              ),
              const SizedBox(
                height: 6,
              ),
              const TextFieldWidget(
                hintText: 'password',
                icon: Icons.lock_open,
                isObsecure: true,
              ),
              const SizedBox(
                height: 22,
              ),
              CustomButtonWidget(buttonText: 'Login', onPressed: () => Navigator.pushNamed(context, '/homepage')),
            ],
          ),
        ],
      ),
    );
  }
}
