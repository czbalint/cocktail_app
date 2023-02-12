import 'package:assignment/UI/pages/home/widgets/drink_list_item.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkList extends StatelessWidget {
  const DrinkList({Key? key, required this.drinks}) : super(key: key);

  final List<Drink> drinks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: drinks.map((e) => DrinkListItem(drink: e)).toList(),
    );
  }
}
