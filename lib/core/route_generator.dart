import 'package:flutter/material.dart';
import 'package:todo_app/core/page_route_names.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/settings/settings_view.dart';
import 'package:todo_app/features/splash/splash_view.dart';
import 'package:todo_app/features/tasks/tasks_view.dart';

class RouteGenerator {
  static Route<dynamic> onGeneratRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRouteNames.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
      case PageRouteNames.tasks:
        return MaterialPageRoute(
          builder: (context) => const TasksView(),
          settings: settings,
        );
      case PageRouteNames.settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
