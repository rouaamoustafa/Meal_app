import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/filters_screen.dart';

import '../module/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex =0 ;
  final List<Meal> _favoriteMeal =[];
  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree:false ,
    Filter.lactoseFree:false,
    Filter.vegetrian :false,
    Filter.vegan:false,
  };


   void _showInfoMessage(String message){
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _setScreen(String identifier){
    Navigator.of(context).pop();
    if (identifier== "filters"){
      Navigator.push(
          context,
          MaterialPageRoute(builder:(ctx)=>const FiltersScreen() )).then((value)=>setState(() => _selectedFilters =value));
    }
  }
    void _toggleMealFAvoriteStatus(Meal meal){
    final isExisting = _favoriteMeal.contains(meal);

    if(isExisting){
     setState(() {
       _favoriteMeal.remove(meal);
       _showInfoMessage("It is not in  the favorite list");
     });
    }else{
      setState(() {
        _favoriteMeal.add(meal);
        _showInfoMessage("It is in  the favorite list");
      });
    }
  }

  void _selectedPage(int index ){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onToggleFavorite: _toggleMealFAvoriteStatus);
    var activePageTitle='Categories';

    if(_selectedPageIndex ==1){
      activePage =  MealsScreen(
          meals: _favoriteMeal,
          onToggleFavorite: _toggleMealFAvoriteStatus);
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex:_selectedPageIndex ,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
