import 'package:bookjuice/utilities/routes.dart';
import 'package:bookjuice/views/landing_page.dart';
import 'package:bookjuice/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../views/Reader_screan.dart';
import '../views/bookdetails.dart';
import '../views/categories.dart';
import '../views/category.dart';
import '../views/login.dart';
import '../views/pages.dart';
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
      return MaterialPageRoute(builder: ((context) => const Pages()));
    case AppRoutes.categories:
      return MaterialPageRoute(builder: ((context) => const Categories()));
    case AppRoutes.category:
      final args = settings.arguments as Map<String, dynamic>;
      final id = args["id"];
      final title = args["title"];
      return MaterialPageRoute(
        builder: ((context) => CategoryScreen(
              id: id,
              title: title,
            )),
      );
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
    default:
      return MaterialPageRoute(builder: ((context) => const Pages()));
  }
}
