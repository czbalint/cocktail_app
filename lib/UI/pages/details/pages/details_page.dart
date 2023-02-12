import 'package:assignment/UI/pages/details/screens/details_screen.dart';
import 'package:flutter/material.dart';

class DetailsPage extends Page {

  final Map<String, dynamic> args;

  const DetailsPage({required this.args}) : super(key: const ValueKey("DetailsPage"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => DetailsScreen(drink: args['drink'])
    );
  }

}