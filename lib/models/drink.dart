import 'package:assignment/models/detail.dart';
import 'package:floor/floor.dart';

class Drink {
  final String name;
  final String imageUrl;
  final String id;

  Detail? detail;

  Drink({required this.name, required this.imageUrl, required this.id, this.detail});
}