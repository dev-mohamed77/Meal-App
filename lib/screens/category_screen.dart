import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widget/category_items.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body: Container(
        margin: EdgeInsets.all(15),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (item) => CategoryItems(
                  id: item.id,
                  title: item.title,
                  color: item.color,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
