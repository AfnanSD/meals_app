import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  // final String mealID;
  static const String routeName = 'MealDetailScreen';
  final Function toggleMeal;
  final Function isfavorite;

  const MealDetailScreen(
      {super.key, required this.toggleMeal, required this.isfavorite});
  //const MealDetailScreen({super.key, required this.mealID});
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final Meal meal =
        DUMMY_MEALS.firstWhere((element) => element.id == routesArgs['mealId']);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ingrediants',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ...buildIngrediantList(meal.ingredients),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ...buildStepsWidget(meal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleMeal(meal.id),
        child: Icon(
          isfavorite(meal.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  List<Widget> buildStepsWidget(List list) {
    int step = 1;
    return list
        .map(
          (e) => Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('${step++}'),
                ),
                title: Text(e),
              ),
              Divider(),
            ],
          ),
        )
        .toList();
  }

  List<Widget> buildIngrediantList(List list) {
    return list
        .map(
          (e) => Container(
            width: double.infinity,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(e),
              ),
            ),
          ),
        )
        .toList();
  }
}
