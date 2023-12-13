import 'package:flutter/material.dart';
import 'package:faerun/screens/components/category.dart';
import 'package:faerun/screens/favorites.dart';
import 'package:faerun/utils/consts/categories.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Créditos"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        applicationName: "Compêndio de Faerûn",
                        applicationIcon: Image.asset(
                          "assets/logo.png",
                          height: 64,
                          width: 64,
                        ),
                        applicationVersion: "0.0.1",
                        children: const [
                          Text(
                            "Esse projeto é um fork interno do projeto "
                            "Hyrule para o curso de Flutter: Animations.\n\n"
                            "Compêndio de Faerûn is not affiliated with, endorsed, sponsored, or specifically approved by Wizards of the Coast LLC. This Compêndio de Faerûn may use the trademarks and other intellectual property of Wizards of the Coast LLC, which is permitted under Wizards' Fan Site Policy. For example, Dungeons & Dragons® is a trademark[s] of Wizards of the Coast. For more information about Wizards of the Coast or any of Wizards' trademarks or other intellectual property, please visit their website at (www.wizards.com).\n\n"
                            "Wizards of the Coast, Dungeons & Dragons, and their logos are trademarks of Wizards of the Coast LLC in the United States and other countries. © 2023 Wizards. All Rights Reserved.\n",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Escolha uma categoria"),
          centerTitle: true,
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favorites(),
                      ));
                },
                icon: const Icon(Icons.bookmark))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 193,
            ),
            children: categories.keys
                .map((e) => Category(
                      category: e,
                      isHighlight: e == "monsters",
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
