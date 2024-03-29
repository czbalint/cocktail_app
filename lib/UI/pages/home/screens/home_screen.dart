import 'package:assignment/UI/bloc/navigator/navigation_bloc.dart';
import 'package:assignment/UI/bloc/navigator/navigation_event.dart';
import 'package:assignment/UI/pages/favourite/bloc/favourite_cubit.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_bloc.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_events.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_states.dart';
import 'package:assignment/UI/pages/home/widgets/drink_list.dart';
import 'package:assignment/UI/pages/home/widgets/drop_down.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CategoryBloc categoryBloc = CategoryBloc();

  @override
  void initState() {
    categoryBloc.add(AppStarted());
    super.initState();
  }

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
                        context.read<NavigationBloc>().add(AddPageEvent(destination: "/favourite"));
                      },
                      icon: const Icon(Icons.favorite)
                    ),
                  );
                }
                return IconButton(
                    onPressed: () {
                      context.read<NavigationBloc>().add(AddPageEvent(destination: "/favourite"));
                    },
                    icon: const Icon(Icons.favorite)
                );
              }
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => categoryBloc,
        child: LoaderOverlay(
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
        ),
      )
    );
  }
}
