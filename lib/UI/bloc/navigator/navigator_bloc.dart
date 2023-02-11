import 'package:assignment/UI/bloc/navigator/navgiator_event.dart';
import 'package:assignment/UI/bloc/navigator/navigator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigatorBloc extends Bloc<CustomNavigatorEvents, CustomNavigationStates> {


  CustomNavigatorBloc() : super(HomePageState()) {
    on<PageChange>(
      (event, emit) async {
        if (event.routName.path == PathName.HOME) {
          emit(HomePageState());
        }
        if (event.routName.path == PathName.FAVOURITE) {
          emit(FavouritePageState());
        }
        if (event.routName.path == PathName.DETAILS) {
          if (event.routName.drink != null) {
            emit(DetailsPageState(event.routName.drink!));
          } else {
            emit(const ErrorPageState("Details drink null"));
          }
        }
      });
  }

}