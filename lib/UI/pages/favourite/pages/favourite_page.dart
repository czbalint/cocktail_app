import 'package:assignment/UI/pages/favourite/screens/favourite_page.dart';
import 'package:flutter/material.dart';

class FavouritePage extends Page {

  const FavouritePage() : super(key: const ValueKey("FavouritePage"));

  ///provide a default Transition for the app (you can delete it if you want, flutter already has one)
  Widget _defaultAnimationBuilder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.elasticIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      transitionDuration: Duration(milliseconds: 1500),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => _defaultAnimationBuilder(context, animation, secondaryAnimation, child),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FavouriteScreen();
      },
    );
  }

}