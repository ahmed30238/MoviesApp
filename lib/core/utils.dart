class AppConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '438d8c4337e4a92c799e756d7684b8ff';
  static const getNowPlayingPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const getPopularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const getTopRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String getMovieDetailsPath(movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String getRecommendationPath(movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static imageUrl(String path) => '$baseImageUrl$path';
}

// https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=438d8c4337e4a92c799e756d7684b8ff
// https://api.themoviedb.org/3/movie/436270?api_key=438d8c4337e4a92c799e756d7684b8ff

// https://api.themoviedb.org/3/movie/now_playing?api_key=438d8c4337e4a92c799e756d7684b8ff

// https://api.themoviedb.org/3/movie/popular?api_key=438d8c4337e4a92c799e756d7684b8ff


// https://api.themoviedb.org/3/movie/top_rated?api_key=438d8c4337e4a92c799e756d7684b8ff
