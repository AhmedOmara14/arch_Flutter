
import 'package:dartz/dartz.dart';
import 'package:movies/core/Failure.dart';
import 'package:movies/domain/entities/MovieModel.dart';
import '../../domain/repositories/HomeRepository.dart';
import '../data_source/HomeRemoteDataSource.dart';
import '../exceptions/ServerException.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies(String query) async {
    try {
      final movieResponse = await remoteDataSource.getMovies(query);

      final movies = movieResponse.movies
          .map((model) => model.toEntity())
          .toList();

      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Some Thing Went Wrong'));
    }
  }
}