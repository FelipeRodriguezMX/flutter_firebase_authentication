import 'package:firebase_authentication/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loginBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginBtn(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.googleLogin();
      },
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          minimumSize: const Size(double.infinity, 60)),
      icon: const FaIcon(FontAwesomeIcons.google),
      label: const Text('Iniciar session con Google'),
    );
  }
}
