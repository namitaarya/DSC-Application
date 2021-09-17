import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  MealItem({
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.id,
  });

  String get complexityText{
    switch (complexity){
      case Complexity.Simple:
      return 'Simple';
      break;

      case Complexity.Challenging:
      return 'Challenging';
      break;

      case Complexity.Hard:
      return 'Hard';
      break;

       default:
       return 'Unknown';
    }
  }

  String get affordabiltyText{
    switch (affordability){
      case Affordability.Affordable:
      return 'Afforrdable';
      break;

      case Affordability.Pricey:
      return 'Pricey';
      break;

      case Affordability.Luxurious:
      return 'Expensive';
      break;

       default:
       return 'Unknown';
    }
  }
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id );



  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5, 
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,),
                      SizedBox(width: 6,),
                      Text('${duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,),
                      SizedBox(width: 6,),
                      Text(complexityText)
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.money,),
                      SizedBox(width: 6,),
                      Text(affordabiltyText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
