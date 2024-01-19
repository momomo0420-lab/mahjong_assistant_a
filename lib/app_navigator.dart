import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mahjong_assistant_a/ui/home/home_screen.dart';
import 'package:mahjong_assistant_a/ui/waiting_tile_checker/waiting_tile_checker_screen.dart';

enum AppScreens {
  home('/'),
  waitingTileChecker('/waiting_tile_checker'),
  ;

  final String path;

  const AppScreens(this.path);
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '麻雀のお助けアプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _buildGoRouter(),
    );
  }

  GoRouter _buildGoRouter() {
    return GoRouter(
      initialLocation: AppScreens.home.path,
      routes: [
        GoRoute(
          path: AppScreens.home.path,
          builder: _buildHomeScreen,
        ),
        GoRoute(
          path: AppScreens.waitingTileChecker.path,
          builder: _buildWaitingTileCheckerScreen,
        ),
      ],
    );
  }
  
  Widget _buildHomeScreen(
    BuildContext context,
    GoRouterState state,
  ) {
    return HomeScreen(
      navigateNextScreen: () => context.push(AppScreens.waitingTileChecker.path),
    );
  }

  Widget _buildWaitingTileCheckerScreen(
    BuildContext context,
    GoRouterState state,
  ) {
    return const WaitingTileCheckerScreen();
  }
}
