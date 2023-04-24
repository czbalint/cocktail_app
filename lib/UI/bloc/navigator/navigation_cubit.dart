import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationCubitStates extends Equatable {
  final List<PageConfig> configs;

  NavigationCubitStates(this.configs);
}

class StackChanged extends NavigationCubitStates {

  StackChanged(List<PageConfig> configs) : super(configs);

  @override
  List<Object?> get props => [configs];
}

class StackUpdate extends NavigationCubitStates {
  StackUpdate(List<PageConfig> configs) : super(configs);

  @override
  List<Object?> get props => [configs];
}

class NavigationCubit extends Cubit<NavigationCubitStates> {

  final NavigationStack _stack;

  NavigationCubit(List<PageConfig> initPages) : _stack = NavigationStack(initPages),
        super(StackChanged(initPages));

  void push(String path, [Map<String, dynamic>? args]) {
    emit(StackUpdate(_stack.configs));
    PageConfig config = PageConfig(location: path, args: args);
    emit(StackChanged(_stack.push(config)));
  }

  void clearAndPush(String path, [Map<String, dynamic>? args]) {
    emit(StackUpdate(_stack.configs));
    PageConfig config = PageConfig(location: path, args: args);
    emit(StackChanged(_stack.clearAndPush(config)));
  }

  void pop() {
    emit(StackChanged(_stack.pop()));
  }

  bool canPop() {
    return _stack.canPop();
  }

  void pushBeneathCurrent(String path, [Map<String, dynamic>? args]) {
    emit(StackUpdate(_stack.configs));
    final PageConfig config = PageConfig(location: path, args: args);
    emit(StackChanged(_stack.pushBeneathCurrent(config)));
  }
}