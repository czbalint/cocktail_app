import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/material.dart';

class ERoutInformationParser extends RouteInformationParser<PageConfig> {

  @override
  Future<PageConfig> parseRouteInformation(RouteInformation routeInformation) async {
    final String path = routeInformation.location ?? '/';
    PageConfig config = PageConfig(location: path);
    return config;
  }

  @override
  RouteInformation restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path.toString());
  }
}