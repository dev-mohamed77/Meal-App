import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meal_details_screen.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String images;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const MealItems({
    this.id,
    this.title,
    this.images,
    this.duration,
    this.affordability,
    this.complexity,
  });

  String get getaffordability {
    switch (affordability) {
      case Affordability.Pricey:
        return ("Pricey");
        break;
      case Affordability.Luxurious:
        return ("Luxurious");
        break;
      case Affordability.Affordable:
        return ("Affordable");
        break;
    }
    return getaffordability;
  }

  String get getcomplexity {
    switch (complexity) {
      case Complexity.Simple:
        return ("Simple");
        break;
      case Complexity.Challenging:
        return ("Challenging");
        break;
      case Complexity.Hard:
        return ("Hard");
        break;
    }
    return getcomplexity;
  }

  void _categoryMealControll(ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.mealDetailsScreen,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _categoryMealControll(context),
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    images,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 218,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 220,
                    padding: EdgeInsets.only(
                      left: 10,
                      bottom: 3,
                      top: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "$duration min",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      getcomplexity,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      getaffordability,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
