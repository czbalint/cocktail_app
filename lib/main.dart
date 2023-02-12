import 'package:assignment/UI/bloc/navigator/navigation_cubit.dart';
import 'package:assignment/UI/pages/favourite/bloc/favourite_cubit.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_bloc.dart';
import 'package:assignment/UI/pages/home/bloc/category/category_events.dart';
import 'package:assignment/UI/widgets/navigation/information_parser.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:assignment/UI/widgets/navigation/router_delegate.dart';
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
  final navigationCubit = NavigationCubit([PageConfig(location: '/')]);

  late CategoryBloc categoryBloc;
  late DrinkDatabase database;

  late ERouterDelegate delegate;
  late ERoutInformationParser parser;

  @override
  void initState()  {
    categoryBloc = CategoryBloc();
    categoryBloc.add(AppStarted());

    delegate = ERouterDelegate(navigationCubit);
    parser = ERoutInformationParser();
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
          create: (context) => FavouriteCubit(context.read<DataSource>())
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => navigationCubit
        )
      ],
      child: MaterialApp.router(
        title: 'Cocktail app',
        theme: ThemeData(primarySwatch: Colors.amber),
        routerDelegate: delegate,
        routeInformationParser: parser,
      ),
    );
  }
}
