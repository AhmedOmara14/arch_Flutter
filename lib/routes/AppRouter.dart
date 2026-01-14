import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/details/DetailsPage.dart';
import '../presentation/home_page/HomePage.dart';
import 'RouteNames.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RouteNames.details,
        name: RouteNames.details,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '0';
          return DetailsPage(id: id);
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}