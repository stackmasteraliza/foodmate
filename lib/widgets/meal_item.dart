import 'package:flutter/material.dart';
import 'package:testing/models/meals.dart';
import 'package:testing/screens/meals_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealsDetailScreen(
                meal: meal,
              ),
            ),
          );
        },
        splashColor: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.schedule, size: 20),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${meal.duration.toString()} min',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.work, size: 20),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          meal.complexity.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.attach_money, size: 20),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          meal.complexity.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
