import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import './models/meal.dart';
import './screens/category_meal_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/navigation_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "isGluten": false,
    "isLactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _avilableMeal = DUMMY_MEALS;
  List<Meal> _mealFavorite = [];
  void _filterSaved(Map<String, bool> selected) {
    setState(() {
      _filter = selected;
      _avilableMeal = DUMMY_MEALS.where((meal) {
        if (_filter["isGluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter["isLactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filter["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _favorite(String mealId) {
    final int mealCount = _mealFavorite.indexWhere((meal) => meal.id == mealId);
    if (mealCount >= 0) {
      setState(() {
        _mealFavorite.removeAt(mealCount);
      });
    } else {
      setState(() {
        _mealFavorite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _favoriteChange(String id) {
    return _mealFavorite.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        primaryColor: Colors.purple,
        fontFamily: "Raleway",
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      routes: {
        "/": (contxt) => NavigationBarScren(_mealFavorite),
        CategoryMealScreen.categoryMealScreen: (context) =>
            CategoryMealScreen(_avilableMeal),
        MealDetailsScreen.mealDetailsScreen: (context) =>
            MealDetailsScreen(_favorite, _favoriteChange),
        FilterScreen.filterRoute: (context) =>
            FilterScreen(_filter, _filterSaved),
      },
    );
  }
}
