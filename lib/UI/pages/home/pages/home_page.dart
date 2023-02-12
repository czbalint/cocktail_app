import 'package:assignment/UI/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page {

  const HomePage() : super(key: const ValueKey("HomePage"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const HomeScreen()
    );
  }

}