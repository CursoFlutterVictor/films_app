import 'dart:convert';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/models/movie_model.dart';
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

  static Future<MovieList?> getMovieListbyIDs(
      {required List<String> idList}) async {
    try {
      // Inicializo la estructura de salida
      MovieList movieList = MovieList();
      movieList.results = [];

      int numMovies = 0;

      // Llamo a la API una vez por cada id de pelicula
      for (String id in idList) {
        Map<String, dynamic> queryParams = {
          "api_key": "a7daad45266c470854b13546370a88c8",
          "language": "es-ES",
        };

        Uri url = Uri.https("api.themoviedb.org", "/3/movie/$id", queryParams);

        var response = await http.get(url);

        if (response.statusCode == 200) {
          // Creo un MovieResult a partir del Movie
          final movie = Movie.fromJson(jsonDecode(response.body));

          MovieResult result = MovieResult(
              adult: movie.adult,
              backdropPath: movie.backdropPath,
              genreIds: null, // no los necesito
              id: movie.id,
              originalLanguage: movie.originalLanguage,
              originalTitle: movie.originalTitle,
              overview: movie.overview,
              popularity: movie.popularity,
              posterPath: movie.posterPath,
              releaseDate: movie.releaseDate,
              title: movie.title,
              video: movie.video,
              voteAverage: movie.voteAverage,
              voteCount: movie.voteCount);

          // Agrego el MovieResult en la estructura del MovieList
          movieList.results?.add(result);
          numMovies = numMovies + 1;
        }
      }

      // Si hay peliculas, completo los campos y retorno el MovieList
      if (numMovies > 0) {
        movieList.page = 1;
        movieList.totalPages = 1;
        movieList.totalResults = numMovies;
        return movieList;
      }

      return null;
    } catch (error) {
      //print(error);
      rethrow;
    }
  }
}
