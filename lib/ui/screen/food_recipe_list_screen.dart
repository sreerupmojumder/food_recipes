import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipes/DB/food_rec_data.dart';
import 'package:food_recipes/model/food_rec_model.dart';

class FoodRecipeListScreen extends StatefulWidget {
  const FoodRecipeListScreen({super.key});

  @override
  State<FoodRecipeListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FoodRecipeListScreen> {
  List<FoodRecModel> recipes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parseJsonData();
  }

  void _parseJsonData() {
    final Map<String, dynamic> data = jsonDecode(recipeJsonData);

    final List<dynamic> recipeList = data['recipes'];

    setState(() {
      recipes = recipeList.map((item) => FoodRecModel.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Food Recipes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return recipes.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListTile(
                  leading: Icon(
                    Icons.lunch_dining_rounded,
                    color: Colors.grey,
                    size: 26,
                  ),
                  title: Text(
                    recipe.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        recipe.description,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      // Text(
                      //   recipe.ingredients.join(','),
                      //   style: TextStyle(color: Colors.grey, fontSize: 14),
                      // ),
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                );
        },
      ),
    );
  }
}
