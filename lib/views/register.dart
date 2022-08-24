import 'package:bookjuice/controllers/auth_controller.dart';
import 'package:bookjuice/widgets/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utilities/routes.dart';
import '../widgets/main_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 

  String? name;
  String? email;
  String? pass;
  String? newpass;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode currentf = FocusNode();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  Future<void> _signup(AuthController value) async {
    try {
    await value.auth.registerWithEmailAndPassword(value.email, value.password);
      if (!mounted) return;
      Navigator.pushNamed(context, AppRoutes.home);
    }on FirebaseAuthException catch (e) {
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
     
      }else if (e.code == 'weak-password') {
        MainDialog(
                context: context, title: 'خطأ', content: "كلمة السر غير قوية يجب ان تحتوي على 6 احرف على الاقل")
            .showAlertDialog();
      }
    }  catch (e) {
      MainDialog(context: context, title: 'Error', content: e.toString())
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider(
        create: (context) => AuthController(auth: auth),
        child: Consumer<AuthController>(
          builder: (context, value, child) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "انشاء حساب",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _FormKey,
                        child: Column(
                          children: [
                            // Provider.of<TFF>(context, listen: true).textForm(
                            //     type: TextInputType.text,
                            //     icon: Icons.person_outline,
                            //     label: "الاسم",
                            //     focus: f1,
                            //     obsecure: false,
                            //     v: (value) {
                            //       if (value!.isEmpty) {
                            //         return "الاسم مطلوب";
                            //       }
                            //       return null;
                            //     },
                            //     save: (value) {
                            //       setState(() {
                            //         name = value!;
                            //         debugPrint(name);
                            //       });
                            //     },
                            //     tabed: () {
                            //           Provider.of<TFF>(context, listen: false)
                            //           .tabed(currentfocus: currentf);
                            //     }),
                            Provider.of<TFF>(context, listen: true).textForm(
                              controller: _emailController,
                              type: TextInputType.emailAddress,
                              icon: Icons.mail_outline,
                              label: "البريد الالكتروني",
                              focus: f2,
                              obsecure: false,
                              v: (value) {
                                if (value!.isEmpty) {
                                  return "البريد الالكتروني مطلوب";
                                }
                                return null;
                              },
                              tabed: () {
                                Provider.of<TFF>(context, listen: false)
                                    .tabed(currentfocus: currentf);
                              },
                              onChanged: value.updateEmail,
                            ),
                            Provider.of<TFF>(context, listen: true).textForm(
                              controller: _passwordController,
                              type: TextInputType.text,
                              icon: Icons.lock_outline,
                              label: "كلمة السر",
                              focus: f3,
                              obsecure: true,
                              v: (value) {
                                if (value!.isEmpty) {
                                  return "كلمة السر مطلوبة";
                                }
                                return null;
                              },

                              onChanged: value.updatePassword,
                              tabed: () {
                                Provider.of<TFF>(context, listen: false)
                                    .tabed(currentfocus: currentf);
                              },

                              // Provider.of<TFF>(context, listen: true).textForm(
                              //   type: TextInputType.text,
                              //   icon: Icons.lock_outline,
                              //   label: "تأكيد كلمة السر",
                              //   focus: f4,
                              //   obsecure: true,
                              //   save: (value) {
                              //     setState(() {
                              //       newpass = value!;
                              //       debugPrint(newpass);
                              //     });
                              //   },
                              //   v: (newvalue) {
                              //     if (newvalue!.isEmpty) {
                              //       return "تأكيد كلمة السر مطلوب";
                              //     } else if (newvalue != pass) {
                              //       return "كلمة السر غير صحيحة";
                              //     }
                              //     return "null";
                              //   },
                              //   tabed: () {
                              //         Provider.of<TFF>(context, listen: false)
                              //           .tabed(currentfocus: currentf);
                              //   },
                              // ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_FormKey.currentState!.validate()) {
                                  _signup(value);
                                }
                              },
                              child: Container(
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    FittedBox(
                                      child: Text(
                                        "تسجيل",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "لديك حساب بالفعل؟",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black45),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              " تسجيل دخول",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
