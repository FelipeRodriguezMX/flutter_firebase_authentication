import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged in'),
        actions: [
          TextButton(
            onPressed: () =>
                Provider.of<GoogleSignInProvider>(context, listen: false)
                    .logout(),
            child: const Text('Cerrar session'),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Perfil'),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            Text(user.displayName!),
            Text(user.email!),
          ],
        ),
      ),
    );
  }
}
