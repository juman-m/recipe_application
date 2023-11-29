import 'dart:convert';

import 'package:http/http.dart';
import 'package:recipes/models/recipe.dart';

// Future<List<Recipe>> getRecipy({required String name}) async {
//   List<Recipe> recipesList = [];

//   try {
//     final url = Uri.parse(
//       'https://api.api-ninjas.com/v1/recipe?query=$name',
//     );
//     final response = await get(url,
//         headers: {'X-Api-Key': 'ljr4uFZ59/k7zLWJEZfOpw==TbZW1HSssmpJdZBq'});
//     print(response.body);

//     if (response.statusCode == 200) {
//       final responseDecode = jsonDecode(response.body);
//       for (var element in responseDecode) {
//         recipesList.add(Recipe.fromJson(element));
//       }
//       return recipesList;
//     } else {
//       return recipesList;
//     }
//   } catch (error) {
//     print("Error: $error");
//     return recipesList;
//   }
// }

Future<List<Recipe>> getRecipe() async {
  List<Recipe> recipesList = [];
  final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php");

  try {
    for (var i = 0; i < 10; i++) {
      final response =
          await get(url, headers: {'Content-Type': 'application/json'});
      print("-------------------$i----------------- ${response.body}");

      if (response.statusCode == 200) {
        final responseDecode = jsonDecode(response.body);
        recipesList.add(Recipe.fromJson(responseDecode));
      }
    }
    print(recipesList[2].meals?[0].strTags);
    return recipesList;
  } catch (error) {
    print("Error: $error");
    return recipesList;
  }
}
