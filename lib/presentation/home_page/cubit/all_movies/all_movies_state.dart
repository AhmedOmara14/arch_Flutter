part of 'all_movies_cubit.dart';

@immutable
sealed class AllMoviesState {
  const AllMoviesState();
}

final class AllMoviesInitial extends AllMoviesState {
  const AllMoviesInitial();
}

final class AllMoviesLoading extends AllMoviesState {
  const AllMoviesLoading();
}

final class AllMoviesLoaded extends AllMoviesState {
  final List<MovieModel> movies;

  const AllMoviesLoaded(this.movies);
}

final class AllMoviesError extends AllMoviesState {
  final String message;

  const AllMoviesError(this.message);
}
