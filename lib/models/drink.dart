import 'package:floor/floor.dart';

@entity
class Drink {
  final String name;
  final String imageUrl;
  @primaryKey
  final String id;

  Drink({required this.name, required this.imageUrl, required this.id});
}