import 'package:assignment/UI/pages/menu/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class MenuPage extends Page {

  const MenuPage() : super(key: const ValueKey("MenuPage"));
  Widget _defaultAnimationBuilder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.elasticIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return Align(
      child: SlideTransition(
        position: animation.drive(tween),
        child: child,
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
        settings: this,
        transitionDuration: Duration(milliseconds: 400),
        reverseTransitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => _defaultAnimationBuilder(context, animation, secondaryAnimation, child),
     pageBuilder: (context, animation, secondaryAnimation) => const MenuScreen()
   );
  }

}