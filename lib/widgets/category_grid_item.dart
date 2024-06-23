import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/module/meal.dart';
import '../data/dummy_dart.dart';
import '../module/category.dart';
import '../screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFavorite,
  });

  final Category category;
  final void Function(Meal meal )onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(category.id);
        final List<Meal> filteredMeal =dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context)=>  MealsScreen(
                  title: category.title,
                  meals: filteredMeal,
                  onToggleFavorite:onToggleFavorite ,
                )
            )
        );
      },
      splashColor: Theme.of(context).primaryColor,
      //borderRadius: BorderRadius.circular(16),
      child: Container(
        padding:const  EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors:[
                category.color.withOpacity(0.54),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            )
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,

            ),
          ),
        ),
      ),
    );
  }
}
