import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/material.dart';

class NavigationStack {
  final List<RouteConfiguration> _routes = [];

  NavigationStack(RouteConfiguration initialRoute) {
    addPage(initialRoute);
  }

  NavigationStack.copy(NavigationStack current) {
    _routes.addAll(current._routes);
  }

  void clear() {
    _routes.clear();
  }

  void addPage(RouteConfiguration routeConfiguration) {
    if (routeConfiguration.page != null) {
      _routes.add(routeConfiguration);
    }
  }

  bool canPop(){
    return _routes.length > 1;
  }

  bool popPage() {
    if (canPop()) {
      _routes.removeLast();
      return true;
    }
    return false;
  }

  RouteConfiguration getTopConfig() {
    return _routes.last;
  }

  List<RouteConfiguration> getRoutes() => _routes;

  List<Page> getPages() => _routes.map((config) => config.page!).toList();
}