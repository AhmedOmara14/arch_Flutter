
import 'package:dartz/dartz.dart';
import '../../core/Failure.dart';
import '../entities/MovieModel.dart';

abstract class HomeRepository {
  Future<List<MovieModel>> getMovies(String query);
}