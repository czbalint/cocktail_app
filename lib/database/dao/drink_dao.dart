import 'package:assignment/models/drink.dart';
import 'package:floor/floor.dart';

@dao
abstract class DrinkDao {
  @Query('SELECT * FROM Drinks')
  Future<List<Drink>> findAllDrink();

  @Query('SELECT * FROM WHERE id = :id')
  Future<Drink?> findDrinkById(int id);

  @insert
  Future<void> insertDrink(Drink drink);
}