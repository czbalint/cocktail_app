import 'package:assignment/database/dao/drink_dao.dart';
import 'package:assignment/database/dao/drink_repository.dart';
import 'package:assignment/database/database/database.dart';
import 'package:assignment/database/entity/floor_drink.dart';

class FloorDrinkRepository implements DrinkRepository<FloorDrink> {
  late DrinkDao drinkDao;

  @override
  Future<void> init() async {
    final database = await $FloorDrinkDatabase.databaseBuilder('app_database.db').build();
    drinkDao = database.drinkDao;
  }

  @override
  Future<List<FloorDrink>> getALLDrinks() {
    return drinkDao.findAllDrink();
  }

  @override
  Future<FloorDrink?> getDrinkById(int id) {
    return drinkDao.findDrinkById(id);
  }

  @override
  Future<void> insertDrink(FloorDrink drink) {
    return drinkDao.insertDrink(drink);
  }

  @override
  Future<void> removeDrink(FloorDrink drink) {
    return drinkDao.deleteDrink(drink);
  }

}