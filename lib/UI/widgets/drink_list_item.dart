import 'package:assignment/UI/bloc/favourite/favourite_cubit.dart';
import 'package:assignment/UI/widgets/photo_network.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkListItem extends StatelessWidget {
  const DrinkListItem({Key? key, required this.drink}) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    var favCubit = context.read<FavouriteCubit>();
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal
                )
              ]
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(drink.name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: BlocBuilder<FavouriteCubit, FavouriteCunitStates>(
                          builder: (context, state) {
                            if (state is FavouriteChange) {}
                            return IconButton(
                              onPressed: () {
                                favCubit.changeFavourite(drink);
                              },
                              icon: Icon(Icons.favorite,
                                size: 30,
                                color: favCubit.containId(drink.id) ? Colors.red : Colors.grey,
                              ),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PhotoNetwork(
                photo: drink.imageUrl,

              )
            ),
          ),
        ),
      ],
    );
  }
}
