import 'package:assignment/UI/bloc/navigator/navigation_event.dart';
import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationStack> {

  NavigationStack currentStack;

  NavigationBloc(this.currentStack) : super(currentStack){
    on<AddPageEvent>((event, emit) {
      var newPage = RouteConfiguration(destination: event.destination, args: event.args);
      currentStack.addPage(newPage);
      emit(NavigationStack.copy(currentStack));
    });

    on<PopPageEvent>((event, emit) {
      currentStack.popPage();
      emit(NavigationStack.copy(currentStack));
    });
  }

  bool didPop() {
    return currentStack.popPage();
  }

  bool canPop() {
    return currentStack.canPop();
  }

}