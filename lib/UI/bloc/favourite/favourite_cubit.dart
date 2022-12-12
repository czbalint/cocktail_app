import 'package:assignment/database/dao/drink_dao.dart';
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
  FavouriteCubit(this.drinkDao) : super(FavouriteInit())  {
    _getAllDrinkFromDatabase();
  }

  final List<Drink> drinks = [];
  final DrinkDao drinkDao;

  void _getAllDrinkFromDatabase() async {
    emit(FavouriteLoading());
    drinks.addAll(await drinkDao.findAllDrink());
    emit(FavouriteChange(drinks: drinks));
  }

  void _addDrink(Drink drink) async {
    emit(FavouriteLoading());
    drinks.add(drink);
    await drinkDao.insertDrink(drink);
    emit(FavouriteChange(drinks: drinks));
  }

  void _removeDrink(Drink drink) async {
    emit(FavouriteLoading());
    drinks.removeWhere((element) => element.id == drink.id);
    await drinkDao.deleteDrink(drink);
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