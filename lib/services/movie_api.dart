import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ratings/models/genre.dart';
import 'package:movie_ratings/models/movie.dart';

class MovieApi {
  static String get _apiKey => dotenv.env['TMDBAPI_KEY'] ?? '';

  String get trendingAllUrl {
    return 'https://api.themoviedb.org/3/trending/all/day?api_key=$_apiKey&language=en-US';
  }

  String get movieGenreUrl {
    return 'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=en';
  }

  String get tvGenreUrl {
    return 'https://api.themoviedb.org/3/genre/tv/list?api_key=$_apiKey&language=en';
  }

  String get nowPlayingUrl {
    return 'https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&language=en-US&page=1';
  }

  Future<List<Movie>> trendingAll() async {
    try {
      final response = await http.get(Uri.parse(trendingAllUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];

        //return the 5 trending movies
        return data
            .where(
              (element) =>
                  element['media_type'] == 'movie' ||
                  element['media_type'] == 'tv',
            )
            .map((movie) => Movie.fromMap(movie))
            .take(5)
            .toList();
      } else {
        print('API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load trending all');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Genre>> getGenre() async {
    try {
      final results = await Future.wait([
        http.get(Uri.parse(movieGenreUrl)),
        http.get(Uri.parse(tvGenreUrl)),
      ]);

      final movieRes = results[0];
      final tvRes = results[1];

      if (movieRes.statusCode == 200 && tvRes.statusCode == 200) {
        final List<dynamic> movieData = jsonDecode(
          utf8.decode(movieRes.bodyBytes),
        )['genres'];
        final List<dynamic> tvData = jsonDecode(
          utf8.decode(tvRes.bodyBytes),
        )['genres'];

        final combinedRawData = [...movieData, ...tvData];

        final genreMap = <int, Genre>{};

        for (var item in combinedRawData) {
          final genre = Genre.fromMap(item);
          genreMap[genre.id] = genre;
        }

        return genreMap.values.toList();
      } else {
        print(
          'API Error: Movie ${movieRes.statusCode} & TV ${tvRes.statusCode}',
        );
        throw Exception('Failed to genres');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> nowPlaying() async {
    try {
      final response = await http.get(Uri.parse(nowPlayingUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];

        return data.map((e) => Movie.fromMap(e)).toList();
      } else {
        print('API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load now playing');
      }
    } catch (e) {
      throw Exception('Failed to load now playing: $e');
    }
  }
}
