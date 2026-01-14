
import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final String title;
  final int? year;
  final String imdbId;
  final int rank;
  final String actors;
  final String imdbUrl;
  final String posterUrl;
  final int photoWidth;
  final int photoHeight;

  const MovieModel({
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

  @override
  List<Object?> get props => [
        title,
        year,
        imdbId,
        rank,
        actors,
        imdbUrl,
        posterUrl,
        photoWidth,
        photoHeight,
      ];
}