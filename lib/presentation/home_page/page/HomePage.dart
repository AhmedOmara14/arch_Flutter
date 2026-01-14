import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/RouteNames.dart';
import '../cubit/all_movies/all_movies_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<AllMoviesCubit, AllMoviesState>(
        builder: (context, state) {
          switch (state) {
            case AllMoviesLoading():
              return const Center(child: CircularProgressIndicator());

            case AllMoviesLoaded(:final movies):
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return ListTile(
                    title: Text(movie.title),
                    onTap: () {
                      context.push(
                        RouteNames.detailsWithId(movie.photoWidth.toString()),
                      );
                    },
                  );
                },
              );

            case AllMoviesError(:final message):
              return Center(child: Text(message));

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
