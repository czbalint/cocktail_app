import 'package:assignment/UI/bloc/category/category_bloc.dart';
import 'package:assignment/UI/bloc/category/category_events.dart';
import 'package:assignment/UI/bloc/favourite/favourite_cubit.dart';
import 'package:assignment/UI/bloc/navigator/navgiator_event.dart';
import 'package:assignment/UI/bloc/navigator/navigator_bloc.dart';
import 'package:assignment/UI/bloc/navigator/navigator_state.dart';
import 'package:assignment/UI/screens/details_screen.dart';
import 'package:assignment/UI/screens/favourite_page.dart';
import 'package:assignment/UI/screens/home_screen.dart';
import 'package:assignment/database/dao/floor_drink_repository.dart';
import 'package:assignment/database/database/data_source.dart';
import 'package:assignment/database/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataSource = DataSource(FloorDrinkRepository());
  await dataSource.init();


  runApp(
    Provider<DataSource>(
      create: (_) => dataSource,
      child: const CocktailApp(),
    )
  );
}

class CocktailApp extends StatefulWidget {
  const CocktailApp({super.key});

  @override
  State<CocktailApp> createState() => _CocktailAppState();
}

class _CocktailAppState extends State<CocktailApp> {
  final navigatorBloc = CustomNavigatorBloc();

  late CategoryBloc categoryBloc;
  late DrinkDatabase database;

  @override
  void initState()  {
    categoryBloc = CategoryBloc();
    categoryBloc.add(AppStarted());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomNavigatorBloc>(
            create: (context) => navigatorBloc
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => categoryBloc
        ),
        BlocProvider<FavouriteCubit>(
          create: (context) => FavouriteCubit(context.read<DataSource>())
        )
      ],
      child: MaterialApp(
        title: 'Cocktail app',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: BlocBuilder<CustomNavigatorBloc, CustomNavigationStates>(
          builder: (context, state) {
            return Navigator(
              pages: [
                //if (state is HomePageState)
                  const MaterialPage(
                      child: HomeScreen()
                  ),
                if (state is FavouritePageState)
                  const MaterialPage(
                    child: FavouriteScreen()
                  ),
                if (state is DetailsPageState)
                  MaterialPage(
                    child: DetailsScreen(drink: state.drink)
                  ),

              ],
              onPopPage: (route, result) {
                context.read<CustomNavigatorBloc>().add(PageChange(RouteNames.home()));
                return route.didPop(result);
              },
            );
          }
        ),

      ),
    );
  }
}
