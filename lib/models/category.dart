import 'package:flutter/material.dart';

class Category {
  final String id; //Unique identifier
  final String title;
  final Color color;

  const Category(
      {@required this.id,
      @required this.title,
      this.color = Colors.orange}); //orange is default color
}  //these are all named args
//values cant be changed once obj is created
