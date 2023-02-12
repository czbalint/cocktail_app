import 'package:assignment/models/drink.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryStates extends Equatable{
  const CategoryStates();
}

class CategoryLoading extends CategoryStates {
  @override
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryStates {
  @override
  List<Object?> get props => [];
}

class CategoryChanged extends CategoryStates {

  final List<Drink> drinks;

  const CategoryChanged({required this.drinks});

  @override
  List<Object?> get props => [drinks];
}

