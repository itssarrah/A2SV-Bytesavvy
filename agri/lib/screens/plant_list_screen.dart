import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../widgets/plant_item.dart';

class PlantListScreen extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: 'apple',
      imageUrl: 'assets/apple.png',
    ),
    Plant(
      name: 'cherry',
      imageUrl: 'assets/cherry.png',
    ),
     Plant(
      name: 'Black Berry',
      imageUrl: 'assets/blackberry.png',
    ),
     Plant(
      name: 'Black Grape',
      imageUrl: 'assets/blackgrape.png',
    ),
     Plant(
      name: 'Corn',
      imageUrl: 'assets/corn.png',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90.0, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "please Choose the type of fruit you want to scan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Fruits",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20), 
              Center( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: plants.map((plant) => PlantItem(plant: plant)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
