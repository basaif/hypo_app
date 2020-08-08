import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/ui/pages/contorl-page.dart';
import 'package:hypoapp/ui/pages/home-page.dart';
import 'package:hypoapp/ui/pages/monitor-page.dart';
import 'package:hypoapp/ui/pages/settings-page.dart';

class AppSkeleton extends StatefulWidget {
  AppSkeleton({Key key}) : super(key: key);

  @override
  _AppSkeletonState createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> {
  int _selectedIndex = 0;

  static const List<Widget> _titles = <Widget>[
    Text(
      AppStrings.homePage,
      style: AppTextStyles.pageHeadlines,
    ),
    Text(
      AppStrings.monitorPage,
      style: AppTextStyles.pageHeadlines,
    ),
    Text(
      AppStrings.controlPage,
      style: AppTextStyles.pageHeadlines,
    ),
    Text(
      AppStrings.settingsPage,
      style: AppTextStyles.pageHeadlines,
    ),
  ];

  static List<Widget> _contentWidgets = <Widget>[
    HomePage(false),
    MonitorPage(),
    ControlPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles.elementAt(_selectedIndex),
        centerTitle: true,
      ),
      body: Center(
        child: _contentWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(AppStrings.homePage),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text(AppStrings.monitorPage),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            title: Text(AppStrings.controlPage),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(AppStrings.settingsPage),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorSets.primaryGreen,
        onTap: _onItemTapped,
        elevation: 0,
          backgroundColor: ColorSets.lightGrey,
          unselectedItemColor: ColorSets.darkGrey,
      ),
    );
  }
}