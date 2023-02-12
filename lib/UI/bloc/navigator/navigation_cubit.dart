import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationStack> {
  NavigationCubit(List<PageConfig> initPages) : super(NavigationStack(initPages));

  void push(String path, [Map<String, dynamic>? args]) {
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.push(config));
  }

  void clearAndPush(String path, [Map<String, dynamic>? args]) {
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.clearAndPush(config));
  }

  void pop() {
    emit(state.pop());
  }

  bool canPop() {
    return state.canPop();
  }

  void pushBeneathCurrent(String path, [Map<String, dynamic>? args]) {
    final PageConfig config = PageConfig(location: path, args: args);
    emit(state.pushBeneathCurrent(config));
  }
}