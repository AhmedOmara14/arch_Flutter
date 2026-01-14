
import 'package:movies/domain/entities/MovieModel.dart';

class MovieModelResponse {
  final String title;
  final int? year;
  final String imdbId;
  final int rank;
  final String actors;
  final String imdbUrl;
  final String posterUrl;
  final int photoWidth;
  final int photoHeight;

  const MovieModelResponse({
    required this.title,
    this.year,
    required this.imdbId,
    required this.rank,
    required this.actors,
    required this.imdbUrl,
    required this.posterUrl,
    required this.photoWidth,
    required this.photoHeight,
  });

  factory MovieModelResponse.fromJson(Map<String, dynamic> json) {
    return MovieModelResponse(
      title: json['#TITLE'] ?? '',
      year: json['#YEAR'],
      imdbId: json['#IMDB_ID'] ?? '',
      rank: json['#RANK'] ?? 0,
      actors: json['#ACTORS'] ?? '',
      imdbUrl: json['#IMDB_URL'] ?? '',
      posterUrl: json['#IMG_POSTER'] ?? '',
      photoWidth: json['photo_width'] ?? 0,
      photoHeight: json['photo_height'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '#TITLE': title,
      '#YEAR': year,
      '#IMDB_ID': imdbId,
      '#RANK': rank,
      '#ACTORS': actors,
      '#IMDB_URL': imdbUrl,
      '#IMG_POSTER': posterUrl,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
    };
  }

  MovieModelResponse copyWith({
    String? title,
    int? year,
    String? imdbId,
    int? rank,
    String? actors,
    String? imdbUrl,
    String? posterUrl,
    int? photoWidth,
    int? photoHeight,
  }) {
    return MovieModelResponse(
      title: title ?? this.title,
      year: year ?? this.year,
      imdbId: imdbId ?? this.imdbId,
      rank: rank ?? this.rank,
      actors: actors ?? this.actors,
      imdbUrl: imdbUrl ?? this.imdbUrl,
      posterUrl: posterUrl ?? this.posterUrl,
      photoWidth: photoWidth ?? this.photoWidth,
      photoHeight: photoHeight ?? this.photoHeight,
    );
  }


  MovieModel toEntity() {
    return MovieModel(
      title: title,
      year: year,
      imdbId: imdbId,
      rank: rank,
      actors: actors,
      imdbUrl: imdbUrl,
      posterUrl: posterUrl,
      photoWidth: photoWidth,
      photoHeight: photoHeight,
    );
  }

}