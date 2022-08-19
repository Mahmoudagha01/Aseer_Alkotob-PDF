import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utilities/routes.dart';

class BookHomeItem extends StatelessWidget {
  const BookHomeItem(
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
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 231, 191, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      img,
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: const Color.fromRGBO(
                    255,
                    231,
                    191,
                    1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      15,
                    ),
                    topRight: Radius.circular(
                      15,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: Text(
                        title,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        author,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
