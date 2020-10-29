import 'package:chapter_7_meal_app/models/meal.dart';

import '../widgets/main_drawer.dart';

import 'favourite_screen.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _favouriteMeal ;

  TabScreen(this._favouriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page' : CategoriesScreen(), 'title' : 'Categories' },
      {'page' :FavouriteScreen(widget._favouriteMeal), 'title' : 'Your Favourite'},
    ];    super.initState();
  }

  void _selectPages(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon:Icon(Icons.category),
          //       text: 'Categories',
          //     ),
          //     Tab(icon:Icon(Icons.star),
          //       text: 'Favourite',),
          //   ],
          // ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          unselectedItemColor: Colors.white,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPages,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star), title: Text('Favourite')),
          ],
        ),
      ),
    );
  }
}

// Widget topTabBar(){
//   TabBarView(
//     children: <Widget>[
//       CategoriesScreen(),
//       FavouriteScreen()
//     ],
//   );
// }
