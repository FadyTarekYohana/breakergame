import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/screens/login.dart';
import 'widgets/screens/homepage.dart';
import 'widgets/screens/gamescreen.dart';
import 'widgets/screens/creditsscreen.dart';
import 'widgets/screens/optionsscreen.dart';
import 'widgets/screens/shopscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Login(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/gamescreen',
      builder: (BuildContext context, GoRouterState state) =>
          const GameScreen(),
    ),
    GoRoute(
      path: '/creditsscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const CreditsScreen(),
    ),
    GoRoute(
      path: '/optionsscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const OptionsScreen(),
    ),
    GoRoute(
      path: '/shopscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const ShopScreen(),
    ),
  ],
);
