import 'package:flutter/material.dart';

import 'package:fitfood/widgets/progress_circle.dart';
import 'package:fitfood/models/notifiers/calories.dart';

class CaloriesCard extends StatelessWidget {
  final double parentsWidth;
  final double parentsHeight;
  final CaloriesModel caloriesModel;

  const CaloriesCard({
    super.key,
    required this.parentsWidth,
    required this.parentsHeight,
    required this.caloriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        shadows: [BoxShadow(color: Color(0xFFCAC4D0), spreadRadius: 1)],
      ),
      width: parentsWidth,
      height: parentsHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                caloriesModel.currentCalories.toStringAsFixed(0),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                width: parentsWidth / 3,
                child: Divider(color: Colors.grey, height: 1),
              ),
              Text(
                caloriesModel.totalCalories.toStringAsFixed(0),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(
            height: parentsHeight * 0.7,
            width: parentsHeight * 0.7,
            child: AnimatedProgressCircle(
              currentCalories: caloriesModel.currentCalories,
              totalCalories: caloriesModel.totalCalories,
            ),
          ),
        ],
      ),
    );
  }
}

/*
// Card variant

Card(
  color: Colors.white,
  shape: const ContinuousRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Calories: ${caloriesModel.currentCalories.toStringAsFixed(0)}',
        ),
        SizedBox(
          height: constraints.maxHeight * 0.7,
          width: constraints.maxHeight * 0.7,
          child: AnimatedProgressCircle(
            currentCalories:
                caloriesModel.currentCalories,
            totalCalories: caloriesModel.totalCalories,
          ),
        ),
      ],
    ),
  ),
)
*/
