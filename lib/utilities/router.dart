import 'package:bookjuice/screens/Reader_screan.dart';
import 'package:bookjuice/screens/bookdetails.dart';
import 'package:bookjuice/screens/categories.dart';

import 'package:bookjuice/screens/pages.dart';
import 'package:bookjuice/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../screens/category.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: ((context) => Pages()));
    case AppRoutes.categories:
      return MaterialPageRoute(builder: ((context) => Categories()));
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
      return MaterialPageRoute(builder: ((context) => Pages()));
  }
}
