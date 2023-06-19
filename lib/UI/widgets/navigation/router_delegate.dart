import 'package:assignment/UI/bloc/navigator/navigation_bloc.dart';
import 'package:assignment/UI/bloc/navigator/navigation_event.dart';
import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ERouterDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final NavigationBloc navigationBloc;

  ERouterDelegate({required this.navigationBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationStack>(
      builder: (context, state) {
        return Navigator(
          key: navigatorKey,
          pages: state.getPages(),
          onPopPage: (route, result) => _onPopPage.call(route, result),
        );
      },
    );
  }

  @override
  Future<bool> popRoute() {
    if (navigationBloc.canPop()) {
      navigationBloc.add(PopPageEvent());
      return Future.value(true);
    }
    return Future.value(false);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result) || !navigationBloc.didPop()) {
      return false;
    }
    return true;
  }


  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    navigationBloc.add(AddPageEvent(destination: configuration.destination, args: configuration.args));

  }

  @override
  RouteConfiguration get currentConfiguration {
    return navigationBloc.currentStack.getTopConfig();
  }
}