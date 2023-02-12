import 'package:assignment/UI/bloc/navigator/navigation_cubit.dart';
import 'package:assignment/UI/widgets/navigation/navigation_stack.dart';
import 'package:assignment/UI/widgets/navigation/page_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ERouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  final NavigationCubit _cubit;

  ERouterDelegate(this._cubit);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationStack>(
      builder: (context, stack) => Navigator(
        pages: stack.pages,
        key: navigatorKey,
        onPopPage: (route, result) => _onPopPage.call(route, result),
      ),
      listener: (context, stack) {}
    );
  }

  @override
  Future<bool> popRoute() async {
    if (_cubit.canPop()) {
      _cubit.pop();
      return Future.value(true);
    }
    return false;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (_cubit.canPop()) {
      _cubit.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  @override
  Future<void> setNewRoutePath(PageConfig configuration) async {
    if (configuration.route != '/') _cubit.push(configuration.route, configuration.args);
  }

  @override
  PageConfig? get currentConfiguration => _cubit.state.last;
}