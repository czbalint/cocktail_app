import 'package:assignment/UI/widgets/navigation/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RouteConfiguration {
  final String destination;
  Page? page;
  Map<String, dynamic> args = {};

  RouteConfiguration({
    required this.destination,
    Map<String, dynamic>? args,
  }) {
    this.args.addIfNotNull(args);
    page = getPage(this);
  }
}

extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}