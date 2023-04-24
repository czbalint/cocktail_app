import 'package:assignment/UI/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends Page {
  const HomePage() : super(key: const ValueKey("HomePage"));

  PageRouteBuilder _pageBuilder() {
    var builder = PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) =>
      const HomeScreen(),
      settings: this,
      transitionDuration: Duration(seconds: 1),
      // reverseTransitionDuration: Duration(seconds: 1)
    );
    return builder;
  }

  @override
  Route createRoute(BuildContext context) {
    return _pageBuilder();
  }
}
