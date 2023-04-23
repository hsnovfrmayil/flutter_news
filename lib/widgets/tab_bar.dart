import 'package:flutter/material.dart';
import 'package:news_app/pages/profile.dart';

import '../pages/home.dart';

import '../pages/search.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _index = 0;
  List<Widget> widgetLists = [HomePage(), SearchPage(), ProfilePage()];
  Widget _newWidget = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _newWidget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
              _newWidget = widgetLists[value];
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
