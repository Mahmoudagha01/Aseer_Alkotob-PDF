
import 'package:bookjuice/controllers/auth_controller.dart';
import 'package:bookjuice/services/auth.dart';
import 'package:bookjuice/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_dialog.dart';
import '../widgets/textform.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode currentf = FocusNode();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  Future login(AuthController value) async {
    try {
      await value.auth.loginWithEmailAndPassword(value.email, value.password);
      if (!mounted) return;
      Navigator.pushNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        MainDialog(
                context: context,
                title: 'خطأ',
                content: "البريد الالكتروني الذي تم ادخاله غير صحيح")
            .showAlertDialog();
      }
      if (e.code == 'user-not-found') {
        MainDialog(
                context: context,
                title: 'خطأ',
                content:
                    "البريد الالكتروني الذي تم ادخاله غير مسجل لدينا يمكنك انشاء حساب جديد")
            .showAlertDialog();
      } else if (e.code == 'wrong-password') {
        MainDialog(
                context: context, title: 'خطأ', content: "كلمة السر غير صحيحة")
            .showAlertDialog();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<AuthController>(
      create: (context) => AuthController(auth: auth),
      child: Consumer<AuthController>(builder: (_, value, __) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "تسجيل دخول",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "من فضلك سجل دخول للمتابعة.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Provider.of<TFF>(context, listen: true).textForm(
                            controller: _emailController,
                            type: TextInputType.emailAddress,
                            icon: Icons.mail_outline,
                            label: "البريد الالكتروني",
                            focus: f1,
                            obsecure: false,
                            onChanged: value.updateEmail,
                            v: (v) {
                              if (v!.isEmpty) {
                                return "البريد الالكنروني مطلوب";
                              }
                              return null;
                            },
                            tabed: () {
                              Provider.of<TFF>(context, listen: false)
                                  .tabed(currentfocus: currentf);
                            }),
                        Provider.of<TFF>(context, listen: true).textForm(
                            controller: _passwordController,
                            type: TextInputType.text,
                            icon: Icons.lock,
                            label: "كلمة السر",
                            focus: f2,
                            obsecure: true,
                            onChanged: value.updatePassword,
                            v: (v) {
                              if (v!.isEmpty) {
                                return "كلمة السر مطلوبة";
                              }
                              return null;
                            },
                            tabed: () {
                              Provider.of<TFF>(context, listen: false)
                                  .tabed(currentfocus: currentf);
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              login(value);
                            }
                          },
                          child: Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              gradient: LinearGradient(colors: [
                                const Color.fromARGB(
                                  255,
                                  235,
                                  166,
                                  162,
                                ),
                                const Color.fromARGB(255, 225, 86, 79),
                                Theme.of(context).primaryColor,
                              ]),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                FittedBox(
                                  child: Text(
                                    "تسجيل دخول",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ليس لديك حساب؟ ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: Text(
                          "انشاء حساب",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text("أو"),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                      },
                      child:  Text("تخطي عملية تسجيل الدخول الان",style: TextStyle(color: Theme.of(context).primaryColor),),)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
