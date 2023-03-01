import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final double runTime;

  const MovieDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
    required this.runTime, 
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        voteAverage,
        title,
        releaseDate,
        runTime
      ];
}

class Genres extends Equatable {
  final String name;
  final int id;
  const Genres({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [
        name,
        id,
      ];
}
