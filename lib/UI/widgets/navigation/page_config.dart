import 'package:assignment/UI/widgets/navigation/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PageConfig extends Equatable {
  late final Uri path;
  late final String route;
  late String? name;
  final Map<String, dynamic> args = {};
  late final Page page;

  PageConfig({
    required String location,
    Map<String, dynamic>? args,
    this.name
  }) {
    path = location.isNotEmpty ? Uri.parse(location) : Uri.parse("/");
    route = path.toString();
    this.args.addIfNotNull(args);
    page = getPage(this);
  }

  @override
  String toString() {
    return 'PageConfig: path = $path, args = $args';
  }

  @override
  List<Object?> get props => [path, args];
}

extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}