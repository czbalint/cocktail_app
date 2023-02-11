import 'package:assignment/models/drink.dart';
import 'package:equatable/equatable.dart';

abstract class CustomNavigationStates extends Equatable {
  const CustomNavigationStates ();
}

class HomePageState extends CustomNavigationStates {
  @override
  List<Object?> get props => [];
}

class FavouritePageState extends CustomNavigationStates {
  @override
  List<Object?> get props => [];
}

class DetailsPageState extends CustomNavigationStates {
  final Drink drink;

  const DetailsPageState(this.drink);

  @override
  List<Object?> get props => [drink];
}

class ErrorPageState extends CustomNavigationStates {
  final String message;

  const ErrorPageState(this.message);

  @override
  List<Object?> get props => [message];
}