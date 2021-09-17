import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: CategoryMeals[index].id ,
              title: CategoryMeals[index].title,
              affordability: CategoryMeals[index].affordability,
              complexity: CategoryMeals[index].complexity,
              duration: CategoryMeals[index].duration,
              imageUrl: CategoryMeals[index].imageUrl,
            );
          },
          itemCount: CategoryMeals.length,
        ));
  }
}
