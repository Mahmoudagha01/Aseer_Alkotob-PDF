import 'package:bookjuice/models/category_model.dart';
import 'package:bookjuice/models/file_model.dart';

import 'package:bookjuice/widgets/GridfixedHeight.dart';
import 'package:bookjuice/widgets/bookitem.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    required this.title,
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;
  final String title;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Category category;
  @override
  Widget build(BuildContext context) {
   
    final categoryBooks = File.filesList.where((element) {
      return element.categories!.contains(widget.id);
    }).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            height: 300,
          ),
          itemBuilder: ((
            context,
            index,
          ) {
            return BookItem(
              author: "${categoryBooks[index].author}",
              dar: "${categoryBooks[index].dar}",
              date: "${categoryBooks[index].date}",
              description: "${categoryBooks[index].description}",
              id: "${categoryBooks[index].id}",
              img: "${categoryBooks[index].img}",
              title: "${categoryBooks[index].title}",
              url: "${categoryBooks[index].url}",
            );
          }),
          itemCount: categoryBooks.length,
        ),
      ),
    );
  }
}
