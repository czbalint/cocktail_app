import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/material.dart';

class ERoutInformationParser extends RouteInformationParser<RouteConfiguration> {

  @override
  Future<RouteConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return RouteConfiguration(destination: '/');
    } else if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'search') {
      return RouteConfiguration(destination:'/search');
    } else if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'favourite') {
      return RouteConfiguration(destination:"/favourite");
    } else if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'details') {
      return RouteConfiguration(destination: '/details', args: uri.queryParameters);
    } else {
      return RouteConfiguration(destination: '/');
    }
  }

  @override
  RouteInformation restoreRouteInformation(RouteConfiguration configuration) {
    return RouteInformation(location: configuration.destination);
  }
}