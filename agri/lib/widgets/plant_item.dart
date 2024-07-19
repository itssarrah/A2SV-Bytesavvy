import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantItem extends StatelessWidget {
  final Plant plant;

  PlantItem({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Image.asset(
            plant.imageUrl,
            width: 150, 
            height: 150, 
            fit: BoxFit.contain, 
          ),
          SizedBox(height: 5),
          Text(
            plant.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
