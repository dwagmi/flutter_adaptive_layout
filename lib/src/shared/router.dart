import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/view/home_screen.dart';
import '../features/page_one/view/page_one.dart';
import '../features/page_two/view/page_two.dart';
import 'views/root_layout.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
    child: HomeScreen(),
  ),
  NavigationDestination(
    label: 'PageOne',
    icon: Icon(Icons.signal_cellular_alt_1_bar_sharp),
    route: '/pageOne',
    child: PageOne(),
  ),
  NavigationDestination(
    label: 'PageTwo',
    icon: Icon(Icons.signal_cellular_alt_2_bar_sharp),
    route: '/pageTwo',
    child: PageTwo(),
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  routes: [
    // Defined in destinations above
    for (final route in destinations)
      GoRoute(
        path: route.route,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: destinations.indexOf(route),
            child: route.child ?? const SizedBox(),
          ),
        ),
      ),
  ],
);
