import '../models/meal.dart';
import '../widgets/item_meal.dart';
import 'package:flutter/material.dart';
import '../dummy_category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> detailedMeal;
  var _loadInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      detailedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if(!_loadInitData){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
       categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
       detailedMeal = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: detailedMeal[index].id,
              title: detailedMeal[index].title,
              imgUrl: detailedMeal[index].imgUrl,
              duration: detailedMeal[index].duration,
              complexity: detailedMeal[index].complexity,
              affordability: detailedMeal[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: detailedMeal.length,
        ));
  }
}
