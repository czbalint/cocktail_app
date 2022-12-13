import 'package:floor/floor.dart';

@Entity(tableName: "drinks")
class FloorDrink {
  final String name;
  final String imageUrl;
  @primaryKey
  final String id;

  FloorDrink(this.name, this.imageUrl, this.id);
}