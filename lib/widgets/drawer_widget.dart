import 'package:bookjuice/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    List<Map> drawerItems = [
      {
        'icon': Icons.home,
        'title': 'الرئيسية',
        "tab": () {
          Navigator.pushNamed(context, AppRoutes.home);
        }
      },
      {
        'icon': Icons.favorite,
        'title': 'المفضلة',
        "tab": () {
          Navigator.pushNamed(context, AppRoutes.favorite);
        }
      },
      {
        'icon': Icons.file_present_sharp,
        'title': 'طلب كتاب',
        "tab": () {
          Navigator.pushNamed(context, AppRoutes.ask);
        }
      },
      {
        'icon': Icons.info_outline,
        'title': 'حول التطبيق',
        "tab": () {
          Navigator.pushNamed(context, AppRoutes.about);
        }
      },
      {
        'icon': Icons.copy,
        'title': 'حقوق الملكية',
        "tab": () {
          Navigator.pushNamed(context, AppRoutes.copy);
        }
      },
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.only(top: 50, bottom: 70, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 0,
              ),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
            ),
            Column(
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: InkWell(
                                onTap: element["tab"],
                                child: Text("${element['title']}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
            StreamBuilder<User?>(
              stream: auth.authStateChange(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;
                  if (user == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        auth.logOut().then((value) => Navigator.pushReplacementNamed(context, AppRoutes.login));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
