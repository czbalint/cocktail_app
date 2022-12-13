import 'package:assignment/database/dao/drink_repository.dart';
import 'package:assignment/database/entity/floor_drink.dart';
import 'package:assignment/models/drink.dart';

class DataSource {
  final DrinkRepository<FloorDrink> database;

  DataSource(this.database);

  Future<void> init() async {
    await database.init();
  }

  Future<List<Drink>> getAllDrinks() async {
    final drinks = await database.getALLDrinks();
    return drinks.map((e) => e.toDrink()).toList();
  }

  Future<Drink?> getDrinkById(int id) async {
    final drink = await database.getDrinkById(id);
    return drink?.toDrink();
  }

  Future<void> insert(Drink drink) async {
    return database.insertDrink(drink.toFloorDrink());
  }

  Future<void> remove(Drink drink) async {
    return database.removeDrink(drink.toFloorDrink());
  }
}

extension DrinkToFloorDrink on Drink {
  FloorDrink toFloorDrink() => FloorDrink(name, imageUrl, id);

}

extension FloorDrinkToDrink on FloorDrink {
  Drink toDrink() => Drink(name: name, imageUrl: imageUrl, id: id);
}