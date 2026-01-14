
import 'package:dio/dio.dart';
import '../api_services/ApiEndpoints.dart';
import '../api_services/DioClient.dart';
import '../entities/MovieResponse.dart';
import '../exceptions/ServerException.dart';

abstract class HomeRemoteDataSource {
  Future<MovieResponse> getMovies(String query);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<MovieResponse> getMovies(String query) async {
    try {
      final response = await dioClient.get(
        ApiEndpoints.searchMovies,
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(response.data);

        if (movieResponse.ok) {
          return movieResponse;
        } else {
          throw ServerException(message:'Failed to load movies');
        }
      } else if (response.statusCode == 401) {
        throw ServerException(message:'Unauthorized');
      } else if (response.statusCode == 404) {
        throw ServerException(message:'Movies not found');
      } else {
        throw ServerException(message:'Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkException(message:'Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(message:'No internet connection');
      }
      throw NetworkException(message:e.message ?? 'Network error');
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message:'Unexpected error: ${e.toString()}');
    }
  }
}