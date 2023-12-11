import 'package:flutter/material.dart';
import 'package:faerun/controllers/api_controller.dart';
import 'package:faerun/screens/results.dart';
import 'package:faerun/utils/consts/categories.dart';

import '../../domain/models/entry.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.category, this.isHighligh = false})
      : super(key: key);
  final String category;
  final bool isHighligh;

  final ApiController apiController = ApiController();

  Future<List<Entry>> getEntries() async {
    return await apiController.getEntriesByCategory(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: InkWell(
            onTap: () async {
              await getEntries().then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Results(entries: value, category: category),
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(16.0),
            child: Ink(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(25, 167, 86, 0),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    width: 4.0,
                    color: const Color.fromARGB(255, 167, 86, 0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6.0,
                        color: const Color.fromARGB(255, 167, 86, 0)
                            .withOpacity(0.2),
                        blurStyle: BlurStyle.outer),
                  ]),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Center(
                    child: Image.asset(
                      "$iconPath$category.png",
                      height: 78 * value,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            categories[category]!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white.withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
