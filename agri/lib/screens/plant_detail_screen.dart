import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  PlantDetailScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Column(
        children: [
          Image.asset(plant.imageUrl),
          SizedBox(height: 10),
          Text(
            plant.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ]
      ),
    );
  }
}
