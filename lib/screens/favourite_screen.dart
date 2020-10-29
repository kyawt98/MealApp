import '../widgets/item_meal.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favourite yet- add now'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            imgUrl: favouriteMeal[index].imgUrl,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
