// import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'package:movie_app/models/movie.dart';

// class MovieApi {
//   static String get _apiKey => dotenv.env['API_KEY'] ?? '';
//   static String get _apiHost => dotenv.env['API_HOST'] ?? '';
//   final String _baseUrl = 'https://movies-ratings2.p.rapidapi.com';

//   static Map<String, String> headers = {
//     'X-Rapidapi-Key': _apiKey,
//     'X-Rapidapi-Host': _apiHost,
//   };

//   Future<List<Movie>> getMovies() async {
//     var url = Uri.parse('$_baseUrl/ratings?mediaType=movie');

//     try {
//       final response = await http.get(url, headers: headers);
//     } catch (e) {}
//   }
// }
