import 'package:flutter/material.dart';

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings? settings})
      : super(builder: (_) => widget, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    // Fades between routes. (If you don't want any animation,
//    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}
