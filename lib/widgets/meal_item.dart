import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../module/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });

  final Meal meal;
  final void Function(Meal meal )onSelectedMeal;

  String get complexityText{
    switch(meal.complexity){
      case Complexity.simple: return 'Simple';break;
      case Complexity.challenging: return 'Challenging';break;
      case Complexity.hard: return 'Hard';break;
      default: return 'Unknown' ; break;
    }
  }
  String get affordabilityText{
    switch(meal.affordability){
      case Affordability.affordable : return 'Affordable' ; break;
      case Affordability.luxurious : return 'luxurious';break;
      case Affordability.pricey : return 'pricey ';break;
      default: return 'Unknown' ; break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onSelectedMeal(meal),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Column(
            children: [
              Stack(
                children: [
                  //Image.network(meal.imageUrl)
                  FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl)),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    //left: 20,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                              meal.title,
                              //textAlign: TextAlign.center,
                              //maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style:
                              const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule,color: Colors.black),
                        const SizedBox(width: 10),
                        Text("${meal.duration} min" , style:const TextStyle(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work ,color: Colors.black),
                        const SizedBox(width: 10),
                        Text("$complexityText ",style:const TextStyle(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money,color: Colors.black),
                        const SizedBox(width: 10),
                        Text(affordabilityText,style:const TextStyle(color: Colors.black)),
                      ],
                    ),

                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}
