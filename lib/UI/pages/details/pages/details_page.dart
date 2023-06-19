import 'package:assignment/UI/pages/details/screens/details_screen.dart';
import 'package:assignment/UI/widgets/navigation/transition_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends TransitionPage {
  const DetailsPage({required super.args}) : super(key: const ValueKey("DetailsPage"));

  @override
  TransitionAnimationBuilder? get animationBuilder => _slideAnimationBuilder;

  Widget _slideAnimationBuilder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
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
  }

  @override
  Widget build(BuildContext context) {
    return DetailsScreen(drink: args['drink']);
  }
}