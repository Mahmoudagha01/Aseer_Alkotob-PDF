import 'package:bookjuice/utilities/router.dart';
import 'package:bookjuice/utilities/routes.dart';

import 'package:flutter/material.dart';

void main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Shamel",
        primaryColor: const Color.fromRGBO(103, 13, 8, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(103, 13, 8, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.home,
    );
  }
}
