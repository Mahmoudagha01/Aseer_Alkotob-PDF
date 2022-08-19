
import 'package:bookjuice/utilities/routes.dart';
import 'package:flutter/material.dart';

Widget categoryItem(dynamic e, BuildContext context) {
  return InkWell(
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(10),
    onTap: () {
      Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.category,arguments: {"id":e.id,"title":e.title});
    },
    child: Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover),
        color: const Color.fromRGBO(222, 182, 171, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          "${e.title}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
