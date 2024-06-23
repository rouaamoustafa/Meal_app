import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/module/category.dart';

import '../data/dummy_dart.dart';
import '../module/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  final void Function(Meal meal )onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    Category catgry;
    return   GridView(
        padding:const EdgeInsets.only(top: 10),
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3/2,
        ),
        children: [
          for (final catgry in availableCategories)
            CategoryGridItem (category:catgry ,onToggleFavorite: onToggleFavorite)
        ],
      );

  }
}
