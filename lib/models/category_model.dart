
class Category {
  String? id;
  String? title;



  Category({this.title, this.id,});

  static List<Category> categoriesList = [
    Category(
      title: "الأكثر شيوعا",
     
      id: "c",
    ),
    Category(
      title: "روايات",
  
      id: "c1",
    ),
    Category(
      title: "الأدب العربي",
  
      id: "c2",
    ),
    Category(
      title: "كتب دينية",
      
      id: "c3",
    ),
    Category(
      title: "السير والتراجم",

      id: "c4",
    ),
    Category(
      title: "التنمية البشرية",

      id: "c5",
    ),
    Category(
      title: "قصص الأطفال",

      id: "c6",
    ),
    Category(
      title: "نصوص",

      id: "c7",
    ),
    Category(
      title: "السياسة",
 
      id: "c8",
    ),
    Category(
      title: "التاريخ",

      id: "c9",
    ),
    Category(
      title: "فكر اسلامي",

      id: "c10",
    ),
    Category(
      title: "علم نفس",

      id: "c11",
    ),
    Category(
      title: "علم اجتماع",

      id: "c12",
    ),
    Category(
      title: "شعر",

      id: "c13",
    ),
   
    Category(
      title: "الصحة",

      id: "c15",
    ),
    Category(
      title: "الاقتصاد",
     
      id: "c16",
    ),
    Category(
      title: "الفلسفة",

      id: "c17",
    ),
    Category(
      title: "فنون",

      id: "c18",
    ),
  ];
}
