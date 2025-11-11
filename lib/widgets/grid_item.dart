import 'package:flutter/material.dart';

import 'package:testing/models/category.dart';

import 'package:testing/screens/meals_screen.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.meal});

  final Category meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealsScreen(meal: meal),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              meal.color.withOpacity(0.75),
              meal.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
