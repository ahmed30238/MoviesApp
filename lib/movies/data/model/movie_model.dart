import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.title,
    required super.releaseDate,
  });

  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(
          json['genre_ids'].map(
            (e) => e,
          ),
        ),
        id: json['id'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        releaseDate: json['release_date'],
      );
}
