import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_ratings/models/genre.dart';
import 'package:movie_ratings/models/movie.dart';
import 'package:movie_ratings/services/movie_api.dart';

final nowPlayingProvider =
    FutureProvider<({List<Movie> movies, Map<int, String> genres})>((
      ref,
    ) async {
      final api = MovieApi();

      final results = await Future.wait([api.nowPlaying(), api.getGenre()]);

      final movies = results[0] as List<Movie>;
      final genres = results[1] as List<Genre>;

      final genreMap = {for (var g in genres) g.id: g.name};

      return (movies: movies, genres: genreMap);
    });
