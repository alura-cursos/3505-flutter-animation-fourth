import 'package:flutter/material.dart';
import 'package:faerun/screens/categories.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(const Faerun());
}

class Faerun extends StatelessWidget {
  const Faerun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faerun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal),
          TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal),
        }),
        colorSchemeSeed: Colors.brown,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const Categories(),
    );
  }
}
