
import 'MovieModel.dart';

class MovieResponse {
  final bool ok;
  final List<MovieModelResponse> movies;
  final int? errorCode;

  MovieResponse({
    required this.ok,
    required this.movies,
    this.errorCode,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      ok: json['ok'] == true,
      movies: json['description'] is List
          ? (json['description'] as List)
          .map((e) =>
          MovieModelResponse.fromJson(e as Map<String, dynamic>))
          .toList()
          : [],
      errorCode: json['error_code'],
    );
  }
}
