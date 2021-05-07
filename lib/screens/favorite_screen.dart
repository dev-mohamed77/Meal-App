import 'package:flutter/material.dart';
import '../widget/meal_items.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> mealFavorite;

  FavoriteScreen(this.mealFavorite);
  @override
  Widget build(BuildContext context) {
    if (mealFavorite.isEmpty) {
      return Center(
        child: Text(
          "You have no favorites yet - start adding some!",
          style: Theme.of(context).textTheme.button.copyWith(
                fontSize: 17,
              ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return MealItems(
            id: mealFavorite[index].id,
            title: mealFavorite[index].title,
            images: mealFavorite[index].imageUrl,
            duration: mealFavorite[index].duration,
            affordability: mealFavorite[index].affordability,
            complexity: mealFavorite[index].complexity,
          );
        },
        itemCount: mealFavorite.length,
      );
    }
  }
}
