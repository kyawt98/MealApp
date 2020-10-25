import '../dummy_category.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DAMMY_MEAL.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imageSection('${selectMeal.imgUrl}'),
            titleSection('Ingredients', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(selectMeal.ingredients[index]),
                ),
              ),
              itemCount: selectMeal.ingredients.length,
            ),),
            titleSection('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index+1)}'),
                    ),
                    title:  Text(selectMeal.steps[index]),
                  ),
                  Divider(

                  )
                ],
              ),
              itemCount: selectMeal.steps.length,
            ),)
          ],
        ),
      ),
    );
  }
}

Widget titleSection(String title, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: Theme.of(context).textTheme.title,
    ),
  );
}

Widget imageSection(String imgUrl) {
  return Container(
    height: 250,
    width: double.infinity,
    child: Image.network(
      imgUrl,
      fit: BoxFit.cover,
    ),
  );
}

Widget buildContainer(Widget child) {
  return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child);
}
