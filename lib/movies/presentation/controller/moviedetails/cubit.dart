import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services_locator/services_locator.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommenation_usecase.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails/states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsCubit() : super(MovieDetailsInitState());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  GetMovieDeatilsUseCase getMovieDeatilsUseCase =
      GetMovieDeatilsUseCase(baseMovieRepo: sl());

  MovieDetails? movieDetails;

  void getMovieDetails(int id) {
    emit(GetMovieDetailsLoadingState());
    getMovieDeatilsUseCase.call(MovieDetailsParameters(id: id)).then((value) {
      value.fold(
        (l) => null,
        (r) => movieDetails = r,
      );
      emit(GetMovieDetailsSuccessState());
    }).catchError((error) {
      emit(GetMovieDetailsErrorState());
    });
  }

  List<Recommendation> recommendationMovies = [];
  void getRecommendationMovies(int id) {
    emit(GetMovieRecommendationLoadingState());
    GetRecommendationUseCase(baseMovieRepo: sl())
        .call(RecommendationParameters(movieId: id))
        .then((value) {
      value.fold(
        (l) => null,
        (r) => recommendationMovies = r,
      );

      emit(GetMovieRecommendationSuccessState());
    }).catchError(
      (error) {
        emit(
          GetMovieRecommendationErrorState(),
        );
      },
    );
  }
}
