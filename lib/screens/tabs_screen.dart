

import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import 'package:todo_bloc/screens/panding_screen.dart';

import 'add_task_screen.dart';
import 'completed_task_screen.dart';
import 'favorite_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {"pageName": const PandingScreen(), "title": 'Panding Task'},
    {"pageName": const CompletedScreen(), "title": 'Completed Task'},
    {"pageName": const FavoriteScreen(), "title": 'Favorite Task'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]["title"]),
        actions: [
          IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const AppDrawer(),
      body: _pageDetails[_selectedPageIndex]["pageName"],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        tooltip: "Add task",
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Panding Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Complated Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite Task",
          ),
        ],
      ),
    );
  }
}
