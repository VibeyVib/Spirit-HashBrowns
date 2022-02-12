import 'package:flutter/material.dart';
import 'package:spirit/src/ui/search_foods.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
   // return SearchFoods();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SearchFoods(),
      backgroundColor: Color(0xffaefeff),
    );
  }
}
