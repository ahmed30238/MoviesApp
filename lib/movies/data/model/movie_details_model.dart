import 'package:movies_app/movies/data/model/genres_mode.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.voteAverage,
      required super.title,
      required super.releaseDate,
      required super.runTime});

  factory MovieDetailsModel.fromjson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
          json['genres'].map(
            (e) => GenresModel.fromjson(e),
          ),
        ),
        id: json['id'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        releaseDate: json['release_date'],
        runTime: json['runtime'].toDouble(),
      );
}
