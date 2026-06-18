import 'package:flutter/material.dart';

class FoodRecipeListScreen extends StatefulWidget {
  const FoodRecipeListScreen({super.key});

  @override
  State<FoodRecipeListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FoodRecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Food Recipes', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.restaurant, color: Colors.grey, size: 26),
            title: Text('title'),
            subtitle: Text('subtitle'),
          );
        },
      ),
    );
  }
}
