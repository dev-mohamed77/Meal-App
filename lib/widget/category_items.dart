import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meal_screen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItems({
    this.id,
    this.title,
    this.color,
  });

  void _categoryControll(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.categoryMealScreen,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.red,
      onTap: () => _categoryControll(context),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
