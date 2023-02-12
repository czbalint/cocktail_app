import 'package:flutter/material.dart';

import 'page_config.dart';

class NavigationStack {
  final List<PageConfig> _stack;

  NavigationStack(this._stack);

  List<Page> get pages => List.unmodifiable(_stack.map((e) => e.page));
  List<PageConfig> get configs => _stack;
  int get length => _stack.length;
  PageConfig get first => _stack.first;
  PageConfig get last => _stack.last;

  void clear() {
    _stack.removeRange(0, _stack.length - 2);
  }

  bool canPop() {
    return _stack.length > 1;
  }

  NavigationStack pop() {
    if (canPop()) _stack.remove(_stack.last);
    return NavigationStack(_stack);
  }

  NavigationStack pushBeneathCurrent(PageConfig config) {
    _stack.insert(_stack.length - 1, config);
    return NavigationStack(_stack);
  }

  NavigationStack push(PageConfig config) {
    if (_stack.last != config) _stack.add(config);
    return NavigationStack(_stack);
  }

  NavigationStack replace(PageConfig config) {
    if (canPop()) {
      _stack.removeLast();
      push(config);
    } else {
      _stack.insert(0, config);
      _stack.removeLast();
    }
    return NavigationStack(_stack);
  }

  NavigationStack clearAndPush(PageConfig config) {
    _stack.clear();
    _stack.add(config);
    return NavigationStack(_stack);
  }

  NavigationStack clearAndPushAll(List<PageConfig> configs) {
    _stack.clear();
    _stack.addAll(configs);
    return NavigationStack(_stack);
  }
}