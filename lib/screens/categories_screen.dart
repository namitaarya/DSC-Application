import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
      return  Container(
        margin: EdgeInsets.all(20),
        child: GridView(
          padding: const EdgeInsets.all(5),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  color: catData.color,
                  title: catData.title,
                  id: catData.id,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 1 / 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 40,
            mainAxisExtent: 100,
          ),
        ),
      );
  }
}
