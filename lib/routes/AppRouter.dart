import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/api_services/DioClient.dart';
import '../data/data_source/HomeRemoteDataSource.dart';
import '../data/repositories/HomeRepositoriesImpl.dart';
import '../domain/repositories/HomeRepository.dart';
import '../presentation/details/DetailsPage.dart';
import '../presentation/home_page/cubit/all_movies/all_movies_cubit.dart';
import '../presentation/home_page/page/HomePage.dart';
import 'RouteNames.dart';

class AppRouter {

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) {
         return BlocProvider(
            create: (context) => AllMoviesCubit(
              homeRepository:  HomeRepositoryImpl(remoteDataSource: HomeRemoteDataSourceImpl(dioClient: DioClient())),
            )..fetchAllMovies(),
            child: const HomePage(),
          );
        },
      ),

      GoRoute(
        path: RouteNames.details,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailsPage(id: id);
        },
      ),
    ],
  );
}
