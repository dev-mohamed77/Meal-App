import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String mealDetailsScreen = "mealDetailsScreen";
  final Function favorite;
  final Function favoriteChange;

  MealDetailsScreen(this.favorite, this.favoriteChange);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> mealArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String mealId = mealArgument["id"];
    final String mealtitle = mealArgument["title"];
    final mealfilter = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealtitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealfilter.imageUrl,
            ),
            SizedBox(
              height: 18,
            ),
            textContent(context, "Ingradients"),
            SizedBox(
              height: 18,
            ),
            mealContent(
              title: mealfilter.ingredients,
              color: Colors.amber,
            ),
            SizedBox(
              height: 18,
            ),
            textContent(context, "Steps"),
            SizedBox(
              height: 18,
            ),
            mealContent(
              title: mealfilter.steps,
              color: Colors.amber,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => favorite(mealId),
        child: Icon(
          favoriteChange(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Text textContent(BuildContext ctx, String title) {
    return Text(
      title,
      style: Theme.of(ctx).textTheme.title,
    );
  }

  Container mealContent({
    @required List title,
    Color color,
  }) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(
              top: 5,
              left: 12,
              right: 12,
              bottom: 5,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title[index],
              style: Theme.of(context).textTheme.button.copyWith(fontSize: 15),
            ),
          );
        },
        itemCount: title.length,
      ),
    );
  }
}
