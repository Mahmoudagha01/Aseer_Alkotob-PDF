import 'package:flutter/material.dart';

import '../utilities/routes.dart';

class BookItem extends StatelessWidget {
  const BookItem(
      {required this.id,
      required this.title,
      required this.author,
      
      required this.dar,
      required this.date,
      required this.description,
      required this.img,
      
      
      required this.url,
      Key? key})
      : super(key: key);
  final String id;
  final String title;
  final String img;
  final String description;
  final String url;
  final String date;
  final String author;
  final String dar;
 

 

  void selectBook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookDetails, arguments: {
      "id": id,
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          selectBook(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 231, 191, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(title),
                ),
              ),
              FittedBox(
                child: Text("$author}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
