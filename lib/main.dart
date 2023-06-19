import 'package:assignment/UI/bloc/navigator/navigation_bloc.dart';
import 'package:assignment/UI/pages/favourite/bloc/favourite_cubit.dart';
import 'package:assignment/UI/widgets/navigation/information_parser.dart';
import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
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
  final navigationBloc = NavigationBloc(NavigationStack(RouteConfiguration(destination: "/")));

  late DrinkDatabase database;


  late ERoutInformationParser parser;

  @override
  void initState()  {
    parser = ERoutInformationParser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavouriteCubit>(
          create: (context) => FavouriteCubit(context.read<DataSource>())
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => navigationBloc
        )
      ],
      child: MaterialApp.router(
        title: 'Cocktail app',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: ERouterDelegate(navigationBloc: navigationBloc),
        routeInformationParser: parser,
      ),
    );
  }
}
