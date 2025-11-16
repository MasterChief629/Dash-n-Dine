import 'dart:ui';

class Categories {
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  List<Categories>? subCategories;
  
  //constructor
  Categories(
    {
      this.name,
      this.icon,
      this.color,
      this.imageName,
      this.subCategories,
    }
  );
}