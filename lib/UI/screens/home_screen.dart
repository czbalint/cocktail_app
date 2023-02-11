import 'package:assignment/UI/bloc/category/category_bloc.dart';
import 'package:assignment/UI/bloc/category/category_states.dart';
import 'package:assignment/UI/bloc/favourite/favourite_cubit.dart';
import 'package:assignment/UI/bloc/navigator/navgiator_event.dart';
import 'package:assignment/UI/bloc/navigator/navigator_bloc.dart';
import 'package:assignment/UI/widgets/drink_list.dart';
import 'package:assignment/UI/widgets/drop_down.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktail list'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: BlocBuilder<FavouriteCubit, FavouriteCunitStates>(
              builder: (context, state) {
                if (state is FavouriteChange) {
                  return Badge(
                    alignment: const AlignmentDirectional(30, 3),
                    label: Text(state.drinks.length.toString()),
                    //position: BadgePosition.topEnd(top: 0, end: 0),
                    child: IconButton(
                      onPressed: () {
                        context.read<CustomNavigatorBloc>().add(PageChange(RouteNames.favourite()));
                      },
                      icon: const Icon(Icons.favorite)
                    ),
                  );
                }
                return IconButton(
                    onPressed: () {
                      context.read<CustomNavigatorBloc>().add(PageChange(RouteNames.favourite()));
                    },
                    icon: const Icon(Icons.favorite)
                );
              }
            ),
          )
        ],
      ),
      body: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: SpinKitPouringHourGlass(
          color: Theme.of(context).primaryColor,
        ),
        child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const CategoryDropDown()
                  ),
                  BlocBuilder<CategoryBloc, CategoryStates>(
                    builder: (context, state) {
                      if (state is CategoryLoading){
                        context.loaderOverlay.show();
                      }

                      if (state is CategoryChanged) {
                        context.loaderOverlay.hide();
                        return Expanded(
                          child: DrinkList(
                            drinks: state.drinks,
                          )
                        );
                      }
                      return Container();
                    }
                  )
                ],
              ),
          ),
      )
    );
  }
}
