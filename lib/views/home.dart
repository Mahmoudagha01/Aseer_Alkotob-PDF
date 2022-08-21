
import 'package:flutter/material.dart';


import '../models/file_model.dart';
import '../widgets/bookhome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    final categoryBooks = File.filesList.where((element) {
      return element.categories!.contains("c1");
    }).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "عصير الكتب - PDF",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 3,
              ),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
              child: Row(
                children: [
                  const Text(
                    "الأكثر شيوعا",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.trending_up_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
            
              child: ListView.builder(
                  itemCount: categoryBooks.length,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BookHomeItem(
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
            )
          ],
        ),
      ),
    );
  }
}
