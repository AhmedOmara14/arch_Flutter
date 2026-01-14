
import 'MovieModel.dart';

class MovieResponse {
  final String description;
  final bool ok;
  final List<MovieModelResponse> movies;
  final String? errorMessage;
  final int? totalResults;

  MovieResponse({
    required this.description,
    required this.ok,
    required this.movies,
    this.errorMessage,
    this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      description: json['description'] ?? '',
      ok: json['ok'] ?? false,
      movies: (json['results'] as List?)
          ?.map((movie) => MovieModelResponse.fromJson(movie as Map<String, dynamic>))
          .toList() ??
          [],
      errorMessage: json['error_message'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'ok': ok,
      'results': movies.map((movie) => movie.toJson()).toList(),
      'error_message': errorMessage,
      'total_results': totalResults,
    };
  }
}