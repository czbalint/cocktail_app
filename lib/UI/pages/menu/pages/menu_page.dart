import 'package:assignment/UI/pages/menu/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class MenuPage extends Page {

  const MenuPage() : super(key: const ValueKey("MenuPage"));

  @override
  Route createRoute(BuildContext context) {
   return MaterialPageRoute(
     settings: this,
     builder: (context) => const MenuScreen()
   );
  }

}