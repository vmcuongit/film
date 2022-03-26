class ApiUrl {
  static const POPULAR_MOVIE_URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";

  static String getCastMovie(int idMovie) {
    return "https://api.themoviedb.org/3/movie/$idMovie/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";
  }
}
