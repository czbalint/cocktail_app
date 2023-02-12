import 'package:equatable/equatable.dart';

abstract class CategoryEvents extends Equatable {
  const CategoryEvents([List props = const []]) : super();
}

class AppStarted extends CategoryEvents {
  @override
  List<Object?> get props => [];
}

class CategoryChange extends CategoryEvents {
  final String name;

  const CategoryChange(this.name);

  @override
  List<Object?> get props => [name];
}