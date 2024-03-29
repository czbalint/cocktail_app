import 'package:assignment/UI/pages/home/bloc/category/category_events.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_states.dart';
import 'package:assignment/database/services/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvents, CategoryStates> {
  final HttpService service = HttpService();

  List<String> categories = [];

  CategoryBloc() : super(CategoryLoading()) {
    on<AppStarted>(
      (event, emit) async {
        emit(CategoryLoading());
        var response = await service.getCategoryList();
        categories = response?.categories ?? [];
        emit(CategoryLoaded());
      }
    );
    on<CategoryChange>(
      (event, emit) async {
        emit(CategoryLoading());
        if (event.name == '') {
          emit(const CategoryChanged(drinks: []));
          return;
        }
        var response = await service.getDrinksByCategory(event.name);
        emit(CategoryChanged(drinks: response?.drinks ?? []));
      }
    );
  }
}