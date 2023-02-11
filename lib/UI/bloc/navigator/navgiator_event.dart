import 'package:assignment/models/drink.dart';
import 'package:equatable/equatable.dart';

abstract class CustomNavigatorEvents extends Equatable {
  const CustomNavigatorEvents([List props = const []]) : super();
}

class PageChange extends CustomNavigatorEvents {
  final RouteNames routName;

  const PageChange(this.routName);

  @override
  List<Object?> get props => [routName];
}

class RouteNames {
  final PathName path;
  late Drink? drink;

  RouteNames.home() : path = PathName.HOME;

  RouteNames.favourite() : path = PathName.FAVOURITE;

  RouteNames.details(Drink drink) : path = PathName.DETAILS {
    drink = drink;
  }
}

enum PathName {
  HOME, FAVOURITE, DETAILS
}