import './dummy_category.dart';
import './models/meal.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_scream.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availabledMeal = DAMMY_MEAL;
  List<Meal> _favouriteMeal =[];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availabledMeal = DAMMY_MEAL.where((meal) {
        if (_filters['gluten'] == !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
   final currentIndex = _favouriteMeal.indexWhere((meal) => meal.id == mealId);
   if(currentIndex >=0){
    setState(() {
      _favouriteMeal.removeAt(currentIndex);
    });
   }else{
     setState(() {
       _favouriteMeal.add(DAMMY_MEAL.firstWhere((meal) => meal.id == mealId));
     });
   }
  }

  bool isMealFavourite(String id){
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'OpenSans',
          textTheme: Theme.of(context).textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_favouriteMeal),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availabledMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite, isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilter)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
