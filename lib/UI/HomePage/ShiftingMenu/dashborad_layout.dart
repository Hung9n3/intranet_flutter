import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petaverse/UI/FoodPicking/food_picking_page.dart';
import 'package:petaverse/UI/GameHub/game_hub_page.dart';
import 'package:petaverse/UI/HomePage/home_page.dart';
import 'package:petaverse/bloc/navigation_bloc.dart';

import 'dashboard.dart';
import 'menu.dart';

const Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardLayout extends StatefulWidget {
  const MenuDashboardLayout({Key? key}) : super(key: key);

  @override
  _MenuDashboardLayoutState createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout>
    with SingleTickerProviderStateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;
    });
  }

  void onMenuItemClicked() {
    setState(() {
      _controller.reverse();
    });

    isCollapsed = !isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage(onMenuTap: onMenuTap),
            onMenuTap: onMenuTap, navigatorKey: _navigatorKey),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, NavigationStates navigationState) {
                return Menu(
                    slideAnimation: _slideAnimation,
                    menuAnimation: _menuScaleAnimation,
                    selectedIndex: findSelectedIndex(navigationState),
                    onMenuItemClicked: onMenuItemClicked);
              },
            ),
            Dashboard(
              duration: duration,
              onMenuTap: onMenuTap,
              scaleAnimation: _scaleAnimation,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              child: BlocBuilder<NavigationBloc, NavigationStates>(builder: (
                context,
                NavigationStates navigationState,
              ) {
                return navigationState as Widget;
              }),
            ),
          ],
        ),
      ),
    );
  }

  int findSelectedIndex(NavigationStates navigationState) {
    if (navigationState is HomePage) {
      return 0;
    } else if (navigationState is FoodPicking) {
      return 1;
    } else if (navigationState is GameHub) {
      return 2;
    } else {
      return 0;
    }
  }
}
