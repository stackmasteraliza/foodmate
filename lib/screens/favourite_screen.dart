import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/providers/favourite_provider.dart';
import 'package:testing/widgets/meal_item.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    Widget content = favouriteMeals.isEmpty
        ? const Center(
            child: Text(
              'No meals added yet',
              style: TextStyle(color: Colors.white),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              meal: favouriteMeals[index],
            ),
            itemCount: favouriteMeals.length,
          );
    return content;
  }
}
