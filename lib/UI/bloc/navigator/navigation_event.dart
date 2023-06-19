import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{}

class AddPageEvent extends NavigationEvent {

  final String destination;
  final Map<String, dynamic>? args;

  AddPageEvent({required this.destination, this.args});

  @override
  List<Object?> get props => [destination, args];
}

class PopPageEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];
}