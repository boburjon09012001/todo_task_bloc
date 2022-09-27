import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) => const RecycleBin());
      case TaskScreen.id:
        return MaterialPageRoute(builder: (context) => const TaskScreen());
      default:
        return null;
    }
  }
}
