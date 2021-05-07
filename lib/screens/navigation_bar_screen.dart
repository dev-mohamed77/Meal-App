import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../widget/my_drawer.dart';

import 'category_screen.dart';
import 'favorite_screen.dart';

class NavigationBarScren extends StatefulWidget {
  final List<Meal> mealFavorite;

  NavigationBarScren(this.mealFavorite);
  @override
  _NavigationBarScrenState createState() => _NavigationBarScrenState();
}

class _NavigationBarScrenState extends State<NavigationBarScren> {
  int _index = 0;
  List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {
        "title": "Category",
        "pages": CategoryScreen(),
      },
      {
        "title": "Favorite",
        "pages": FavoriteScreen(widget.mealFavorite),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(_pages[_index]["title"]),
      ),
      body: _pages[_index]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int value) {
          setState(() {
            _index = value;
          });
        },
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
