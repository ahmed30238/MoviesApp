import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils.dart';
import 'package:movies_app/movies/data/model/movie_details_model.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';
import 'package:movies_app/movies/data/model/recomendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommenation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  );
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  );
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      AppConstants.getNowPlayingPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromjson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromjson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
      AppConstants.getPopularPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromjson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromjson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      AppConstants.getTopRatedPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromjson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      AppConstants.getMovieDetailsPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromjson(response.data);
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
      AppConstants.getRecommendationPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromjson(response.data),
      );
    }
  }
}
