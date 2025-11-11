import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/data/dummy_data.dart';

import 'package:testing/providers/filters_provider.dart';

final filteredMealProvider = StateProvider((ref) {
  const meals = dummyMeals;
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
