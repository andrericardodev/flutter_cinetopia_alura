import '../api_key.dart';

const String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=1";

const String upcomingUrl =
    "https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&region=US&page=1";

const String movieUrlPrefix =
    "https://api.themoviedb.org/3/search/movie?query=";

const String movieFilterSuffix = "&include_adult=false&language=en-US&page=1";

const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500/";

const requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiKey'
};
