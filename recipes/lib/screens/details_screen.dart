import 'package:flutter/material.dart';
import 'package:recipes/main.dart';
import 'package:recipes/models/recipe.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    List<String> words = [];
    recipe.meals?[0].strTags != null
        ? words = recipe.meals![0].strTags!.split(',')
        : words = [];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            recipe.meals?[0].strMealThumb ??
                "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-376464.jpg&fm=jpg",
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            recipe.meals?[0].strMeal ?? "-",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                letterSpacing: 2,
                                color: Color(0xFF001E00),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 0),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            LikedList.add(recipe);
                          },
                          child: const Icon(
                            Icons.favorite_border_rounded,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    words.isNotEmpty
                        ? SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: words.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(children: [
                                    Chip(
                                      // avatar: logo,
                                      label: Text(
                                        words[index],
                                        // style:
                                        //     const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ]);
                                }),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (recipe.meals?[0].strArea)!.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF637663),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      recipe.meals?[0].strCategory ?? "-",
                      style: const TextStyle(
                        color: Color(0xFFC1C1C1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Instructions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      recipe.meals?[0].strInstructions ?? "-",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
