import 'package:assignment/UI/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends Page {

  const HomePage() : super(key: const ValueKey("HomePage"));

  @override
  Route createRoute(BuildContext context) {
    return PageTransition(
        type: PageTransitionType.rightToLeft,
        child: HomeScreen(),
        inheritTheme: true,
        ctx: context,
        isIos: true,
      settings: this
    );
  }

}