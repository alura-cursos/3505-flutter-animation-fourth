import 'package:flutter/material.dart';
import 'package:faerun/controllers/api_controller.dart';
import 'package:faerun/screens/results.dart';
import 'package:faerun/utils/consts/categories.dart';

import '../../domain/models/entry.dart';

class Category extends StatefulWidget {
  const Category({Key? key, required this.category, this.isHighligh = false})
      : super(key: key);
  final String category;
  final bool isHighligh;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  final ApiController apiController = ApiController();

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1,
    );

    if (widget.isHighligh) {
      _animationController.repeat(
        reverse: true,
      );
    } else {
      _animationController.animateTo(1);
    }

    super.initState();
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
                        Results(entries: value, category: widget.category),
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
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: _animationController,
                child: Center(
                  child: Image.asset(
                    "$iconPath${widget.category}.png",
                    fit: BoxFit.fitHeight,
                    color: Color.fromARGB(
                      255,
                      255,
                      255,
                      (255 * _animationController.value).floor(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            _animationController.value.toString(),
            //categories[widget.category]!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white.withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  Future<List<Entry>> getEntries() async {
    return await apiController.getEntriesByCategory(category: widget.category);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
