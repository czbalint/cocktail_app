import 'package:assignment/UI/pages/favourite/screens/favourite_page.dart';
import 'package:flutter/material.dart';

class FavouritePage extends Page {

  const FavouritePage() : super(key: const ValueKey("FavouritePage"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const FavouriteScreen()
    );
  }

}