// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/baseusecase/base_usecases.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repo.dart';

class GetRecommendationUseCase extends BaseUseCases<List<Recommendation>, RecommendationParameters> {
  BaseMovieRepo baseMovieRepo;
  GetRecommendationUseCase({
    required this.baseMovieRepo,
  });
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await baseMovieRepo.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;
  const RecommendationParameters({
    required this.movieId,
  });
  @override
  List<Object?> get props => [
        movieId,
      ];
}
