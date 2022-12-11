import 'package:assignment/database/dao/drink_dao.dart';
import 'package:assignment/models/drink.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Drink])
abstract class DrinkDatabase extends FloorDatabase {
  DrinkDao get drinkDao;
}