import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/baseusecase/base_usecases.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repo.dart';

class GetMovieDeatilsUseCase
    extends BaseUseCases<MovieDetails, MovieDetailsParameters> {
  BaseMovieRepo baseMovieRepo;
  GetMovieDeatilsUseCase({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
