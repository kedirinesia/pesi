import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
   List<CategoryModel> getCategories(){
     List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(name: 'Fresh Produce', iconPath: 'assets/icons/brokoli.svg', boxColor: Color(0xff92A3FD))
    );
    categories.add(CategoryModel(name: 'Meat', iconPath: 'assets/icons/daging.svg', boxColor: Color(0xff92A3FD)));

    categories.add(
      CategoryModel(name: 'Frozen Food', iconPath: 'assets/icons/frozenFood.svg', boxColor: Color(0xff92A3FD))
    );
     return categories;
   }
}
