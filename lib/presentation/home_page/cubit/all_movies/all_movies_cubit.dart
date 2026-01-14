import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/MovieModel.dart';
import '../../../../domain/repositories/HomeRepository.dart';


part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final HomeRepository homeRepository;

  AllMoviesCubit({required this.homeRepository})
      : super(const AllMoviesInitial());

  Future<void> fetchAllMovies() async {
    emit(const AllMoviesLoading());

    try {
      final movies = await homeRepository.getMovies("Avatar");
      emit(AllMoviesLoaded(movies));
    } catch (e) {
      emit(const AllMoviesError('Failed to load movies'));
    }
  }
}
