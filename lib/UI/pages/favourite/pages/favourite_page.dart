import 'package:assignment/UI/pages/favourite/screens/favourite_page.dart';
import 'package:assignment/UI/widgets/navigation/transition_page.dart';
import 'package:flutter/material.dart';

class FavouritePage extends TransitionPage {

  const FavouritePage({required super.args}) : super(key: const ValueKey("FavouritePage"));

  @override
  Widget build(BuildContext context) {
    return const FavouriteScreen();
  }



}