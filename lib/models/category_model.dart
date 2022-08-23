class Category {
  String? id;
  String? title;
  bool? isSelected;

  Category({
    this.title,
    this.id,
    this.isSelected,
  });

  static List<Category> categoriesList = [
    Category(
      title: "الأكثر شيوعا",
      isSelected: true,
      id: "c",
    ),
    Category(
      title: "روايات",
      id: "c1",
      isSelected: false,
    ),
    Category(
      title: "الأدب العربي",
      id: "c2",
      isSelected: false,
    ),
    Category(
      title: "كتب دينية",
      id: "c3",
      isSelected: false,
    ),
    Category(
      title: "السير والتراجم",
      id: "c4",
      isSelected: false,
    ),
    Category(
      title: "التنمية البشرية",
      id: "c5",
      isSelected: false,
    ),
    Category(
      title: "قصص الأطفال",
      id: "c6",
      isSelected: false,
    ),
    Category(
      title: "نصوص",
      id: "c7",
      isSelected: false,
    ),
    Category(
      title: "السياسة",
      id: "c8",
      isSelected: false,
    ),
    Category(
      title: "التاريخ",
      id: "c9",
      isSelected: false,
    ),
    Category(
      title: "فكر اسلامي",
      id: "c10",
      isSelected: false,
    ),
    Category(
      title: "علم نفس",
      id: "c11",
      isSelected: false,
    ),
    Category(
      title: "علم اجتماع",
      id: "c12",
      isSelected: false,
    ),
    Category(
      title: "شعر",
      id: "c13",
      isSelected: false,
    ),
    Category(
      title: "الصحة",
      id: "c15",
      isSelected: false,
    ),
    Category(
      title: "الاقتصاد",
      id: "c16",
      isSelected: false,
    ),
    Category(
      title: "الفلسفة",
      id: "c17",
      isSelected: false,
    ),
    Category(
      title: "فنون",
      id: "c18",
      isSelected: false,
    ),
  ];
}
