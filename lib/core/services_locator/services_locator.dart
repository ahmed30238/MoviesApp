import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repo.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/cubit.dart';

var sl = GetIt.instance;

class ServicesLocator {
  void init() {

    
    sl.registerLazySingleton(() => MoviesCubit());

// UseCase
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        sl(),
      ),
    );

// Repository
    sl.registerLazySingleton<BaseMovieRepo>(
      () => MoviesRepository(
        baseMovieRemoteDataSource: sl(),
      ),
    );

// dataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
