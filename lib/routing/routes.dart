import 'package:breakergame/presentation/profile_screen.dart';
import 'package:breakergame/routing/auth.dart';
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
      //to check for authentication
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Authorize(),
    ),
    GoRoute(
      //to go to signup page
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) => const SignUp(),
    ),
    GoRoute(
      //to go to home page
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      //to go to game screen
      path: '/gamescreen',
      builder: (BuildContext context, GoRouterState state) =>
          GameScreen(level: state.extra.toString()),
    ),
    GoRoute(
      //to go to credit screen
      path: '/creditsscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const CreditsScreen(),
    ),
    GoRoute(
      // to go to profile screen
      path: '/profilescreen',
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileScreen(),
    ),
    GoRoute(
      //to go to options screen
      path: '/optionsscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const OptionsScreen(),
    ),
    GoRoute(
      //to go to shop screen
      path: '/shopscreen',
      builder: (BuildContext context, GoRouterState state) =>
          const ShopScreen(),
    ),
    GoRoute(
      //to go to level screens
      path: '/levels',
      builder: (BuildContext context, GoRouterState state) =>
          const LevelsScreen(),
    ),
    GoRoute(
      //to go to level builder as admin
      path: '/levelbuilder',
      builder: (BuildContext context, GoRouterState state) =>
          const LevelBuilder(),
    ),
  ],
);
