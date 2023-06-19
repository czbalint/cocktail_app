import 'package:assignment/UI/pages/home/screens/home_screen.dart';
import 'package:assignment/UI/widgets/navigation/transition_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends TransitionPage {
  const HomePage({required super.args}) : super(key: const ValueKey("HomePage"));

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }


}
