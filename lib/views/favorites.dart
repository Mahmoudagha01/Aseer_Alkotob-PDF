import 'package:bookjuice/models/file_model.dart';
import 'package:bookjuice/widgets/GridfixedHeight.dart';
import 'package:bookjuice/widgets/bookitem.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الكتب المفضلة"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: File.favoriteBooks.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/empty.json',
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "لم يتم اضافة كتب الى قائمة المفضلة حتى الان\n ابدأ باضافة البعض",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              )
            : GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  height: 300,
                ),
                itemCount: File.favoriteBooks.length,
                itemBuilder: (context, index) {
                  return BookItem(
                      id: "${File.favoriteBooks[index].id}",
                      title: "${File.favoriteBooks[index].title}",
                      author: "${File.favoriteBooks[index].author}",
                      dar: "${File.favoriteBooks[index].dar}",
                      date: "${File.favoriteBooks[index].date}",
                      description: "${File.favoriteBooks[index].description}",
                      img: "${File.favoriteBooks[index].img}",
                      url: "${File.favoriteBooks[index].url}");
                },
              ),
      ),
    );
  }
}
