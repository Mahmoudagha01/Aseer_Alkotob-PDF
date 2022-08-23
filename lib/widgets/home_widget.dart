import 'dart:ui';

import 'package:bookjuice/models/category_model.dart';
import 'package:bookjuice/views/bookdetails.dart';
import 'package:flutter/material.dart';

import '../models/file_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  int _selectedindex = 0;
  bool isDrawerOpen = false;
  String id = "c";

  @override
  Widget build(BuildContext context) {
    final categoryBooks = File.filesList.where((element) {
      return element.categories!.contains(id);
    }).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.5 : 0),
        duration: const Duration(
          milliseconds: 250,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            isDrawerOpen ? 40 : 0.0,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.menu,
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 10;
                              yOffset = 170;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  const Text(
                    "عصير الكتب - PDF",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 3,
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
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.search),
                  Text('Search pet to adopt'),
                  Icon(Icons.settings)
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.categoriesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            Category.categoriesList[_selectedindex].isSelected =
                                false;
                            _selectedindex = index;
                            Category.categoriesList[_selectedindex].isSelected =
                                true;
                            id = Category.categoriesList[_selectedindex].id!;
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 100,
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/Mask2.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Category.categoriesList[index].isSelected!
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(
                                    0,
                                    10,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: FittedBox(
                                  child: Text(
                                    "${Category.categoriesList[index].title}",
                                    style: TextStyle(
                                      color: Category
                                              .categoriesList[index].isSelected!
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryBooks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetails(
                            bookId: "${categoryBooks[index].id}",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 220,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[300],
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(
                                      0,
                                      10,
                                    ),
                                  )
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "${categoryBooks[index].img}",
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              margin: const EdgeInsets.only(
                                top: 60,
                                bottom: 20,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(
                                        0,
                                        10,
                                      ))
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20,
                                  ),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FittedBox(
                                      child: Text(
                                        "${categoryBooks[index].title}",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FittedBox(
                                      child: Text(
                                        "${categoryBooks[index].author}",
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FittedBox(
                                      child: Text(
                                        "عدد الصفحات : ${categoryBooks[index].pageNum}",
                                        style: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
