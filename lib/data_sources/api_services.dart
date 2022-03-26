import 'dart:convert';
import 'package:film/resources/models/cast.dart';
import 'package:film/resources/models/movie.dart';
import 'package:film/data_sources/api_urls.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const IMAGE_MOVIE_URL = "https://image.tmdb.org/t/p/w500";
  static const BACKGROUND_DETAIL_MOVIE_URL =
      "https://image.tmdb.org/t/p/original";

  Future<List<Movie>> fetchMoviePopular() async {
    List<Movie> listPopular = [];
    try {
      var response = await http.get(Uri.parse(ApiUrl.POPULAR_MOVIE_URL));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        var listPopular_temp = jsonBody['results'];
        listPopular_temp.forEach((json) {
          listPopular.add(Movie.fromJson(json));
        });
      }
    } catch (e) {
      print(e);
    }

    return listPopular;
  }

  Future<List<Cast>> fetchCastMovie(int? idMovie) async {
    List<Cast> listCast = [];
    try {
      var response = await http.get(Uri.parse(ApiUrl.getCastMovie(idMovie!)));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        var listCast_temp = jsonBody['cast'];
        listCast_temp.forEach((json) {
          listCast.add(Cast.fromJson(json));
        });
      }
    } catch (e) {
      print(e);
    }
    return listCast;
  }
}
