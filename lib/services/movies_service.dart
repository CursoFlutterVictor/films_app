import 'dart:convert';
import 'package:films_app/models/movie_list_model.dart';
import 'package:http/http.dart' as http;

class ServiceGetMovies {
  static Future<MovieList?> getPopularMovies({int? page}) async {
    try {
      final Map<String, dynamic> queryParams = {
        "api_key": "a7daad45266c470854b13546370a88c8",
        "language": "es-ES",
        "page": page == null || page < 1 ? "1" : page.toString(),
      };

      Uri url =
          Uri.https("api.themoviedb.org", "/3/movie/popular", queryParams);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);

        final movieList = MovieList.fromJson(jsonDecode(response.body));

        /*
        movieList.results?.forEach((element) {
          print(element.title);
          print(element.voteAverage);
        });
        */

        return movieList;
      }
    } catch (error) {
      rethrow;
      //print(error);
    }

    return null;
  }

  static Future<MovieList?> getTopRatedMovies({int? page}) async {
    try {
      final Map<String, dynamic> queryParams = {
        "api_key": "a7daad45266c470854b13546370a88c8",
        "language": "es-ES",
        "page": page == null || page < 1 ? "1" : page.toString(),
      };

      Uri url =
          Uri.https("api.themoviedb.org", "/3/movie/top_rated", queryParams);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);

        final movieList = MovieList.fromJson(jsonDecode(response.body));

        /*
        movieList.results?.forEach((element) {
          print(element.title);
          print(element.voteAverage);
        });
        */

        return movieList;
      }
    } catch (error) {
      rethrow;
      //print(error);
    }

    return null;
  }

  static Future<MovieList?> getUpcomingMovies({int? page}) async {
    try {
      final Map<String, dynamic> queryParams = {
        "api_key": "a7daad45266c470854b13546370a88c8",
        "language": "es-ES",
        "page": page == null || page < 1 ? "1" : page.toString(),
      };

      Uri url =
          Uri.https("api.themoviedb.org", "/3/movie/upcoming", queryParams);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);

        final movieList = MovieList.fromJson(jsonDecode(response.body));

        /*
        movieList.results?.forEach((element) {
          print(element.title);
          print(element.voteAverage);
        });
        */

        return movieList;
      }
    } catch (error) {
      rethrow;
      //print(error);
    }

    return null;
  }

  static Future<MovieList?> searchMovies({String? query, int? page}) async {
    try {
      final Map<String, dynamic> queryParams = {
        "api_key": "a7daad45266c470854b13546370a88c8",
        "language": "es-ES",
        "query": query,
        "include_adult": "true",
        "page": page == null || page < 1 ? "1" : page.toString(),
      };

      Uri url = Uri.https("api.themoviedb.org", "/3/search/movie", queryParams);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);

        final movieList = MovieList.fromJson(jsonDecode(response.body));

        /*
        movieList.results?.forEach((element) {
          print(element.title);
        });
        */

        return movieList;
      }
    } catch (error) {
      rethrow;
      //print(error);
    }

    return null;
  }
}
