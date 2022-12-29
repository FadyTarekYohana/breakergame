import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/login_screen.dart';
import '../presentation/home_screen.dart';
import '../presentation/game_screen.dart';
import '../presentation/credits_screen.dart';
import '../presentation/options_screen.dart';
import '../presentation/shop_screen.dart';
import '../presentation/levels_screen.dart';
import '../presentation/level_builder_screen.dart';
import '../presentation/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
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
