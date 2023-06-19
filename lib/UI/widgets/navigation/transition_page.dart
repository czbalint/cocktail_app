import 'package:flutter/material.dart';

typedef TransitionAnimationBuilder = Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
    );

abstract class TransitionPage extends Page {
  final Map<String, dynamic> args;
  final int transitionDuration, reverseTransitionDuration; //milliseconds

  final TransitionAnimationBuilder? animationBuilder;

  const TransitionPage({
    required this.args,
    required super.key,
    this.transitionDuration = 400,
    this.reverseTransitionDuration = 400,
    this.animationBuilder,
  });

  Widget build(BuildContext context);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: transitionDuration),
      reverseTransitionDuration: Duration(milliseconds: reverseTransitionDuration),
      transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
          ) =>
      animationBuilder?.call(
        context,
        animation,
        secondaryAnimation,
        child,
      ) ??
          _defaultAnimationBuilder(
            context,
            animation,
            secondaryAnimation,
            child,
          ),
      pageBuilder: ( context, animation, animation2 ) => build(context),
      settings: this,
    );
  }

  Widget _defaultAnimationBuilder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
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
  }
}