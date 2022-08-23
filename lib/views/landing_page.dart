import 'package:bookjuice/views/home_screen.dart';
import 'package:bookjuice/views/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
      stream: auth.authStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const OnBoardingPage();
          }
          return const HomePage();
        }
      
        return  Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
          ),
        );
      },
    );
  }
}
