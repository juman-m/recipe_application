import 'package:flutter/material.dart';
import 'package:recipes/main.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/screens/details_screen.dart';
import 'package:recipes/screens/home_screen/recipe_container_widget.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipesList = LikedList;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Likes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )),
        body: recipesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 170 / 272,
                    ),
                    itemCount: recipesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print("Building RecipeContainer for index $index");
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        recipe: recipesList[index],
                                      )));
                        },
                        child: RecipeContainer(
                          recipe: recipesList[index],
                        ),
                      );
                    },
                  ),
                ),
              )
            : const Center(child: Text("Save your first recipe!")));
  }
}
