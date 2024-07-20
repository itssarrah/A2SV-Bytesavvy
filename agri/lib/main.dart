import 'package:agri/screens/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sidebar_state.dart';
import 'widgets/side_bar.dart';  
import 'screens/plant_list_screen.dart';  

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SidebarState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sidebarState = Provider.of<SidebarState>(context);

    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: _getSelectedScreen(sidebarState.selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return PlantListScreen();
      case 1:
        return BouncingColumn();
      case 2:
        return PlantListScreen();
      default:
        return PlantListScreen();
    }
  }
}
