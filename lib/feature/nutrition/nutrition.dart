import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Nutrition'),
    );
  }
}
