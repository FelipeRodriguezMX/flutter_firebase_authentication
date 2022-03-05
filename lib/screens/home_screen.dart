import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/provider/google_sign_in.dart';
import 'package:firebase_authentication/screens/login.dart';
import 'package:firebase_authentication/screens/loggedIn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            log('1');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            log('2');
            return const LoggedIn();
          } else if (snapshot.hasError) {
            log('3');
            return const Center(child: Text('Hubo un error'));
          } else {
            log('4');
            return const LogIn();
          }
        },
      ),
    );
  }
}
