import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../module/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,

  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title==null ? content(context) :  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title !),
          backgroundColor: Colors.red,
        ),
        body:content(context)


    );
  }
  SingleChildScrollView content (BuildContext context){
    return SingleChildScrollView(
      child: Column(
          children:
          meals.map((e) =>
              MealItem(
                meal: e,
                onSelectedMeal: (Meal meal) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder:
                          (ctx)=>MealDetailsScreen(meal: meal, onToggleFavorite:onToggleFavorite,)
                      )
                  );

                },
              )
          ).toList()

      ),
    );
  }
}
