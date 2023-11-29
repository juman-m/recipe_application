import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      alignment: Alignment.topCenter,
      width: 150,
      height: 272,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70),
            bottomLeft: Radius.circular(27),
            bottomRight: Radius.circular(27),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              recipe.meals?[0].strMealThumb ??
                  "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-376464.jpg&fm=jpg",
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            recipe.meals?[0].strMeal ?? "-",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            (recipe.meals?[0].strArea)!.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF637663),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            recipe.meals?[0].strCategory ?? "-",
            style: const TextStyle(
              color: Color(0xFFC1C1C1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
