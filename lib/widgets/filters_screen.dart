import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}
 enum Filter{
   glutenFree,
   lactoseFree,
   vegan,
   vegetrian,
 }
class _FiltersScreenState extends State<FiltersScreen> {
   bool _glutenFreeFilter = false;
   bool _lactoseFreeFilter = false;
   bool _veganFreeFilter = false;
   bool _vegetarianFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectedScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if (identifier == "meals"){
      //     Navigator.pushReplacement(context,MaterialPageRoute(builder:(ctx)=>const TabsScreen() ));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: ()async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFreeFilter,
            Filter.vegetrian: _vegetarianFreeFilter
          });
          return false;
        },
        child: Column(
          children:[
            customSwitch(context,"Gluten-Free","Only include gluten-free meals",
              _glutenFreeFilter,
              (bool value) {
              setState(() {
                _glutenFreeFilter = value;
              });
            },),
            customSwitch(context,"Lactose-Free","Only include lactose-free meals",
              _lactoseFreeFilter,
                  (bool value) {
                setState(() {
                  _lactoseFreeFilter = value;
                });
              },
            ),
            customSwitch(context,"Vegan-Free","Only include vegan-free meals",
              _veganFreeFilter,
                  (bool value) {
                setState(() {
                  _veganFreeFilter = value;
                });
              },
            ),
            customSwitch(context,"Vegetarian-Free","Only include vegetarian-free meals",
              _vegetarianFreeFilter,
                  (bool value) {
                setState(() {
                  _vegetarianFreeFilter = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  SwitchListTile customSwitch(BuildContext context ,String title ,String subtitle ,bool filter ,Function(bool newValue) onChanged){

    return SwitchListTile(
            title:Text(
                title,
                 style:Theme.of(context).textTheme.titleLarge!.copyWith(
                 color:Theme.of(context).colorScheme.onBackground,
              )
            ),
            subtitle:Text(
                subtitle,style:Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Theme.of(context).colorScheme.onBackground,
              )
            ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding:const EdgeInsets.only(left:34 , right: 22),
          value: filter,
          onChanged:onChanged,
        );

  }
}
