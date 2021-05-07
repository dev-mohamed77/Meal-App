import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String filterRoute = "filterRoute";
  final Map<String, bool> filterSaved;
  final Function savedSelection;

  const FilterScreen(
    this.filterSaved,
    this.savedSelection,
  );
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGluten = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactose = false;
  @override
  void initState() {
    super.initState();
    isGluten = widget.filterSaved["isGluten"];
    isVegan = widget.filterSaved["vegan"];
    isVegetarian = widget.filterSaved["vegetarian"];
    isLactose = widget.filterSaved["isLactose"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filterMeal = {
                "isGluten": isGluten,
                "isLactose": isLactose,
                "vegan": isVegan,
                "vegetarian": isVegetarian,
              };
              widget.savedSelection(_filterMeal);
            },
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
          buildSwitchSelected(
            ctx: context,
            title: "Gluten-Free",
            subTitle: "Only include gluten-free meals.",
            value: isGluten,
            switchValue: (bool value) {
              setState(() {
                isGluten = value;
              });
            },
          ),
          buildSwitchSelected(
            ctx: context,
            title: "Lacost-Free",
            subTitle: "Only include Lacost-Free meals.",
            value: isLactose,
            switchValue: (bool value) {
              setState(() {
                isLactose = value;
              });
            },
          ),
          buildSwitchSelected(
            ctx: context,
            title: "vegan",
            subTitle: "Only include vegan meals.",
            value: isVegan,
            switchValue: (bool value) {
              setState(() {
                isVegan = value;
              });
            },
          ),
          buildSwitchSelected(
            ctx: context,
            title: "Vegetarian",
            subTitle: "Only include Vegetarian meals.",
            value: isVegetarian,
            switchValue: (bool value) {
              setState(() {
                isVegetarian = value;
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchSelected({
    BuildContext ctx,
    String title,
    String subTitle,
    bool value,
    Function switchValue,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(ctx).textTheme.title,
      ),
      subtitle: Text(subTitle),
      value: value,
      onChanged: switchValue,
    );
  }
}
