import 'package:flutter/material.dart';
import 'package:recipes/screens/home_screen/display_all_recipes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Recipes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: DisplayAllRecipes()),
    );
  }
}
