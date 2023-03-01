import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/baseusecase/base_usecases.dart';
import 'package:movies_app/core/services_locator/services_locator.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitialState());

  static MoviesCubit get(context) => BlocProvider.of(context);

  List<Movie> nowPlayingMovies = [];
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase =
      GetNowPlayingMoviesUseCase(sl());


  void getNowPlayingMovies() {
    emit(GetNowPlayingMoviesLoadigState());
    GetNowPlayingMoviesUseCase(sl()).call(const NoParameters()).then((value) {
      value.fold(
        (l) => null,
        (r) => nowPlayingMovies = r,
      );
      // if (kDebugMode) {
      //   print(value);
      // }
      emit(GetNowPlayingMoviesSuccessState());
    }).catchError(
      (error) {
        emit(
          GetNowPlayingMoviesErrorState(),
        );
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  List<Movie> popularMovies = [];
  void getPopularMovies() {
    emit(GetPopularMoviesLoadigState());
    GetPopularMoviesUseCase(sl()).call(const NoParameters()).then((value) {
      value.fold(
        (l) => null,
        (r) => popularMovies = r,
      );
      // if (kDebugMode) {
      //   print(value);
      // }
      emit(GetPopularMoviesSuccessState());
    }).catchError(
      (error) {
        emit(
          GetPopularMoviesErrorState(),
        );
        // if (kDebugMode) {
        //   print(error.toString());
        // }
      },
    );
  }

  List<Movie> topRatedMovies = [];
  void gettopRatedMovies() {
    emit(GetTopRatedMoviesLoadigState());
    GetTopRatedMoviesUseCase(sl()).call(const NoParameters()).then((value) {
      value.fold(
        (l) => null,
        (r) => topRatedMovies = r,
      );
      // if (kDebugMode) {
      //   print(value);
      // }
      emit(GetTopRatedMoviesSuccessState());
    }).catchError(
      (error) {
        emit(
          GetTopRatedMoviesErrorState(),
        );
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
