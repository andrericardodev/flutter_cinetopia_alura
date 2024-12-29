import 'dart:convert';

import 'package:flutter_cinetopia_alura/app/helpers/consts.dart';
import 'package:flutter_cinetopia_alura/app/models/movie.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }

      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}

class SearchForMovie implements SearchMoviesService {
  List<Movie> movies = <Movie>[];
  final String query;

  SearchForMovie({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(movieUrlPrefix + query + movieFilterSuffix),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }

      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}

class SearchForUpcomingMovies implements SearchMoviesService {
  final List<Movie> movieList = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async{
    try {
      final response = await http.get(Uri.parse(upcomingUrl), headers: requestHeader);
      if (response.statusCode == 200) {
        for (dynamic movie in jsonDecode(response.body)["results"]) {
          movieList.add(Movie.fromMap(movie));
        }
        return movieList;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return movieList;
    }
  }
}
