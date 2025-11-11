import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/models/category.dart';
import 'package:testing/providers/filtered_meals_provider.dart';
import 'package:testing/widgets/meal_item.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key, required this.meal});

  final Category meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummy = ref.watch(filteredMealProvider);
    final filteredMeals =
        dummy.where((m) => m.categories.contains(meal.id)).toList();

    Widget content = filteredMeals.isEmpty
        ? const Center(
            child: Text(
              'No meals added yet',
              style: TextStyle(color: Colors.white),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              meal: filteredMeals[index],
            ),
            itemCount: filteredMeals.length,
          );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      body: content,
    );
  }
}
