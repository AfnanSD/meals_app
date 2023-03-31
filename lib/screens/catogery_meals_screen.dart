import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../model/meal.dart';

class CatogeryScreen extends StatefulWidget {
  static const String routeName = 'CatogeryScreen';
  final List<Meal> avialableMeals;

  const CatogeryScreen({super.key, required this.avialableMeals});
  // final String id;
  // final String title;
  // const CatogeryScreen({
  //   super.key,
  //   required this.id,
  //   required this.title,
  // });

  @override
  State<CatogeryScreen> createState() => _CatogeryScreenState();
}

class _CatogeryScreenState extends State<CatogeryScreen> {
  late List<Meal> catoggryMeals;
  String categoryTitle = '';

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'].toString();
    catoggryMeals = widget.avialableMeals.where(
      (element) {
        return element.categories.contains(routeArgs['id']);
      },
    ).toList();
  }

  void removeMeal(String mealId) {
    setState(() {
      catoggryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            mealId: catoggryMeals[index].id,
            title: catoggryMeals[index].title,
            imageUrl: catoggryMeals[index].imageUrl,
            duration: catoggryMeals[index].duration,
            complexity: catoggryMeals[index].complexity,
            affordability: catoggryMeals[index].affordability,
          );
        },
        itemCount: catoggryMeals.length,
      ),
    );
  }
}
