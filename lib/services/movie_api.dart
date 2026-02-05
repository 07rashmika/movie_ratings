import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ratings/models/movie.dart';

class MovieApi {
  static String get _apiKey => dotenv.env['TMDBAPI_KEY'] ?? '';
  String get trendingAllUrl {
    return 'https://api.themoviedb.org/3/trending/all/day?api_key=$_apiKey&language=en-US';
  }

  Future<List<Movie>> trendingAll() async {
    try {
      final response = await http.get(Uri.parse(trendingAllUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];

        return data.map((movie) => Movie.fromMap(movie)).toList();
      } else {
        print('API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load trending all');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
