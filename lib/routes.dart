import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/screens/loginscreen.dart';
import 'widgets/screens/homepage.dart';
import 'widgets/screens/gamescreen.dart';
import 'widgets/screens/creditsscreen.dart';
import 'widgets/screens/optionsscreen.dart';
import 'widgets/screens/shopscreen.dart';
import 'widgets/screens/levelsscreen.dart';
import 'widgets/screens/levelbuilder.dart';
import 'widgets/screens/signupscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Login(),
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) => const SignUp(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/gamescreen',
      builder: (BuildContext context, GoRouterState state) =>
          GameScreen(level: state.extra.toString()),
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
    GoRoute(
      path: '/levels',
      builder: (BuildContext context, GoRouterState state) =>
          const LevelsScreen(),
    ),
    GoRoute(
      path: '/levelbuilder',
      builder: (BuildContext context, GoRouterState state) =>
          const LevelBuilder(),
    ),
  ],
);
