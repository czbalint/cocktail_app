import 'package:assignment/UI/pages/details/screens/details_screen.dart';
import 'package:assignment/UI/widgets/navigation/transition_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends TransitionPage {
  const DetailsPage({required super.args}) : super(key: const ValueKey("DetailsPage"));

  @override
  Widget build(BuildContext context) {
    return DetailsScreen(drink: args['drink']);
  }


}