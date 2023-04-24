import 'package:assignment/UI/pages/details/pages/details_page.dart';
import 'package:assignment/UI/pages/favourite/pages/favourite_page.dart';
import 'package:assignment/UI/pages/home/pages/home_page.dart';
import 'package:assignment/UI/pages/menu/pages/menu_page.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/material.dart';

Page getPage(PageConfig config) {
  Page p = _routes[config.route]?.call(config.args) ?? const HomePage();
  return p;
}

Map<String, Page Function(Map<String, dynamic>)> _routes = {
  '/search': (args) =>  const HomePage(),
  '/favourite': (args) => const FavouritePage(),
  '/details': (args) => DetailsPage(args: args),
  '/': (arg) => const MenuPage()
};

