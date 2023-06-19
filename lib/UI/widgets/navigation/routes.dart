import 'package:assignment/UI/pages/details/pages/details_page.dart';
import 'package:assignment/UI/pages/favourite/pages/favourite_page.dart';
import 'package:assignment/UI/pages/home/pages/home_page.dart';
import 'package:assignment/UI/pages/menu/screens/menu_screen.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/material.dart';

Page getPage(RouteConfiguration config) {
  Page p = _routes[config.destination]?.call(config.args) ?? HomePage(args: config.args);
  return p;
}

Map<String, Page Function(Map<String, dynamic>)> _routes = {
  '/search': (args) =>  HomePage(args: args),
  '/favourite': (args) => FavouritePage(args: args),
  '/details': (args) => DetailsPage(args: args),
  '/': (arg) => MaterialPage(child: MenuScreen())
};

