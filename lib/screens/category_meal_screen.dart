import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_items.dart';

class CategoryMealScreen extends StatelessWidget {
  static const categoryMealScreen = "categoryMealScreen";
  final List<Meal> mealAvilable;

  const CategoryMealScreen(this.mealAvilable);
  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = category["id"];
    final categoryTitle = category["title"];
    final categoryMeal = mealAvilable.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return MealItems(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            images: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
