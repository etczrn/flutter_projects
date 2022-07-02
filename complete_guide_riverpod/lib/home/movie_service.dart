import 'package:complete_guide_riverpod/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie.dart';

class MovieService {
  MovieService(this._environmentConfig, this._dio);

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/550?api_key=${_environmentConfig.movieApiKey}");
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: true);

    return movies;
  }
}

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);

  return MovieService(config, Dio());
});
