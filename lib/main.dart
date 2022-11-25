import 'package:assignment/UI/bloc/category/category_bloc.dart';
import 'package:assignment/UI/bloc/category/category_events.dart';
import 'package:assignment/UI/bloc/favourite/favourite_cubit.dart';
import 'package:assignment/UI/screens/favourite_page.dart';
import 'package:assignment/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const CocktailApp());
}

class CocktailApp extends StatefulWidget {
  const CocktailApp({super.key});

  @override
  State<CocktailApp> createState() => _CocktailAppState();
}

class _CocktailAppState extends State<CocktailApp> {
  late CategoryBloc categoryBloc;

  @override
  void initState() {
    categoryBloc = CategoryBloc();
    categoryBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) => categoryBloc
        ),
        BlocProvider<FavouriteCubit>(
          create: (context) => FavouriteCubit()
        )
      ],
      child: MaterialApp(
        title: 'Cocktail app',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const HomeScreen(),
        onGenerateRoute: (route) {
          switch(route.name) {
            case "/favourite":
              return MaterialPageRoute(
                settings: const RouteSettings(name: "/favourite"),
                builder: (context) => const FavouritePage()
              );
            case "/home":
              return MaterialPageRoute(
                  settings: const RouteSettings(name: "/home"),
                  builder: (context) => const HomeScreen()
              );
          }
          return null;
        },
      ),
    );
  }
}
