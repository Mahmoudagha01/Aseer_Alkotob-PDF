
import 'package:bookjuice/services/auth.dart';
import 'package:bookjuice/utilities/router.dart';
import 'package:bookjuice/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/textform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
         Provider<AuthBase>(create: (context) => Auth(),),
        ChangeNotifierProvider<TFF>(
          create: (_) => TFF(),
        ),
      
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Shamel",
          primaryColor: const Color.fromRGBO(105, 10, 22, 1),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(105, 10, 22, 1),
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landing,
      ),
    );
  }
}
