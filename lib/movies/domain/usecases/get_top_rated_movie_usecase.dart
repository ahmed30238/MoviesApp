import 'package:dartz/dartz.dart';
import 'package:movies_app/core/baseusecase/base_usecases.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUseCases<List<Movie>,NoParameters> {
  BaseMovieRepo baseMovieRepo;
  GetTopRatedMoviesUseCase(
    this.baseMovieRepo,
  );

  @override
  Future<Either<Failure, List<Movie>>> call(parameters) async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
