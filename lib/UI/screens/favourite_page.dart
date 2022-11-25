import 'package:assignment/UI/bloc/favourite/favourite_cubit.dart';
import 'package:assignment/UI/widgets/drink_list.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteCunitStates>(
        builder: (context, state) {
          List<Drink> list = [];

          if (state is FavouriteChange) {
            list = state.drinks;
          }
          return DrinkList(drinks: list);
        }
      ),
    );
  }
}
