abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class GetNowPlayingMoviesLoadigState extends MoviesStates {}

class GetNowPlayingMoviesSuccessState extends MoviesStates {}

class GetNowPlayingMoviesErrorState extends MoviesStates {}

class GetPopularMoviesLoadigState extends MoviesStates {}

class GetPopularMoviesSuccessState extends MoviesStates {}

class GetPopularMoviesErrorState extends MoviesStates {}

class GetTopRatedMoviesLoadigState extends MoviesStates {}

class GetTopRatedMoviesSuccessState extends MoviesStates {}

class GetTopRatedMoviesErrorState extends MoviesStates {}
