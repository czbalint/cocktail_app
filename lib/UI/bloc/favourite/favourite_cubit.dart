import 'package:assignment/database/dao/drink_dao.dart';
import 'package:assignment/database/database/data_source.dart';
import 'package:assignment/models/drink.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FavouriteCunitStates extends Equatable {
  const FavouriteCunitStates();
}

class FavouriteInit extends FavouriteCunitStates {
  @override
  List<Object?> get props => [];
}

class FavouriteChange extends FavouriteCunitStates {
  final List<Drink> drinks;

  const FavouriteChange({required this.drinks});

  @override
  List<Object?> get props => [drinks];
}

class FavouriteLoading extends FavouriteCunitStates {
@override
List<Object?> get props => [];
}

class FavouriteCubit extends Cubit<FavouriteCunitStates> {
  FavouriteCubit(this.dataSource) : super(FavouriteInit())  {
    _getAllDrinkFromDatabase();
  }

  final List<Drink> drinks = [];
  final DataSource dataSource;

  void _getAllDrinkFromDatabase() async {
    emit(FavouriteLoading());
    drinks.addAll(await dataSource.getAllDrinks());
    emit(FavouriteChange(drinks: drinks));
  }

  void _addDrink(Drink drink) async {
    emit(FavouriteLoading());
    drinks.add(drink);
    await dataSource.insert(drink);
    emit(FavouriteChange(drinks: drinks));
  }

  void _removeDrink(Drink drink) async {
    emit(FavouriteLoading());
    drinks.removeWhere((element) => element.id == drink.id);
    await dataSource.remove(drink);
    emit(FavouriteChange(drinks: drinks));
  }

  void changeFavourite(Drink drink) {
    if (containId(drink.id)) {
      _removeDrink(drink);
      return;
    }
    _addDrink(drink);
  }

  bool containId(String id){
    return drinks.any((element) => element.id == id);
  }
}