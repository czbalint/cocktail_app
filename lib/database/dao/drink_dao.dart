import 'package:assignment/database/entity/floor_drink.dart';
import 'package:floor/floor.dart';

@dao
abstract class DrinkDao {
  @Query('SELECT * FROM Drinks')
  Future<List<FloorDrink>> findAllDrink();

  @Query('SELECT * FROM WHERE id = :id')
  Future<FloorDrink?> findDrinkById(int id);

  @insert
  Future<void> insertDrink(FloorDrink drink);

  @delete
  Future<void> deleteDrink(FloorDrink drink);
}