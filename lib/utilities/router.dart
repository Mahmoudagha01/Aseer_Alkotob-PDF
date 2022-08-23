import 'package:bookjuice/utilities/routes.dart';
import 'package:bookjuice/views/about.dart';
import 'package:bookjuice/views/ask.dart';
import 'package:bookjuice/views/copy.dart';
import 'package:bookjuice/views/favorites.dart';
import 'package:bookjuice/views/home_screen.dart';
import 'package:bookjuice/views/landing_page.dart';
import 'package:bookjuice/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../views/Reader_screan.dart';
import '../views/bookdetails.dart';
import '../views/login.dart';

import '../views/register.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landing:
      return MaterialPageRoute(builder: ((context) => const LandingPage()));
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: ((context) => const OnBoardingPage()));
    case AppRoutes.login:
      return MaterialPageRoute(builder: ((context) => const Login()));
    case AppRoutes.register:
      return MaterialPageRoute(builder: ((context) => const SignUp()));
    case AppRoutes.home:
      return MaterialPageRoute(builder: ((context) => const HomePage()));
    case AppRoutes.bookDetails:
      final args = settings.arguments as Map<String, dynamic>;
      final id = args["id"];
      return MaterialPageRoute(
          builder: ((context) => BookDetails(
                bookId: id,
              )));
    case AppRoutes.readscreen:
      final args = settings.arguments as Map<String, dynamic>;
      final url = args["url"];
      return MaterialPageRoute(builder: ((context) => ReaderScreen(url)));
    case AppRoutes.favorite:
      return MaterialPageRoute(builder: ((context) => const Favorite()));
    case AppRoutes.about:
      return MaterialPageRoute(builder: ((context) => const About()));
    case AppRoutes.copy:
      return MaterialPageRoute(builder: ((context) => const Copy()));
    case AppRoutes.ask:
      return MaterialPageRoute(builder: ((context) => const Ask()));
    default:
      return MaterialPageRoute(builder: ((context) => const LandingPage()));
  }
}
