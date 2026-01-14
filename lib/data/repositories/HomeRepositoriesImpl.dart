
import 'package:movies/domain/entities/MovieModel.dart';
import '../../domain/repositories/HomeRepository.dart';
import '../data_source/HomeRemoteDataSource.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieModel>> getMovies(String query) async {
      final movieResponse = await remoteDataSource.getMovies(query);

      final movies = movieResponse.movies
          .map((model) => model.toEntity())
          .toList();

      return movies;
  }
}