import 'package:chapter_7_meal_app/screens/filter_screen.dart';
import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text('Cooking up', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Theme.of(context).primaryColor
            ),),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}

Widget buildListTile(String title, IconData icon, Function tabController){
  return ListTile(
    leading: Icon(icon, size: 26, ),
    title: Text(title, style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold
    ),),
    onTap: tabController,
  );
}
