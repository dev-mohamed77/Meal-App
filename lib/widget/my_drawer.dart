import 'package:flutter/material.dart';
import 'package:mealapp/screens/filter_screen.dart';

class MyDrawer extends StatelessWidget {
  void _selectedDrawer(BuildContext ctx, int index) {
    Navigator.of(ctx).pushReplacementNamed(
      index == 1 ? "/" : FilterScreen.filterRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.amber,
            child: Text(
              "Cooking UP!",
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 35,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          buildDrawerContent(
            context,
            "Meals",
            Icons.work,
            () => _selectedDrawer(context, 1),
          ),
          buildDrawerContent(
            context,
            "Filters",
            Icons.settings,
            () => _selectedDrawer(context, 2),
          ),
        ],
      ),
    );
  }

  ListTile buildDrawerContent(
      BuildContext ctx, String title, IconData icon, Function ontap) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(ctx).textTheme.title.copyWith(
              fontSize: 30,
            ),
      ),
      leading: Icon(
        icon,
      ),
      onTap: ontap,
    );
  }
}
