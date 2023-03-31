import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(
                title: e.title,
                color: e.color,
                id: e.id,
              ))
          .toList(),
    );
  }
}
