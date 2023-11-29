import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/screens/details_screen.dart';
import 'package:recipes/screens/home_screen/recipe_container_widget.dart';
import 'package:recipes/services/recipe_api.dart';

class DisplayAllRecipes extends StatefulWidget {
  const DisplayAllRecipes({super.key});

  @override
  State<DisplayAllRecipes> createState() => _DisplayAllRecipesState();
}

class _DisplayAllRecipesState extends State<DisplayAllRecipes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: getRecipe(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          List<Recipe> recipesList = snapshot.data!;

          return recipesList.isNotEmpty
              ? SizedBox(
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
                )
              : const Center(child: Text("No recipes available."));
        } else {
          return const Center(child: Text("Unexpected state."));
        }
      },
    );
  }
}
