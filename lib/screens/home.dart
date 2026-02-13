import 'package:flutter/material.dart';

import 'package:movie_ratings/widgets/media_type_buttons.dart';
import 'package:movie_ratings/widgets/trending_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TrendingMovies(),
          const SizedBox(height: 20),
          Padding(
            padding: const .symmetric(horizontal: 14.0),
            child: const MediaTypeButtons(),
          ),
        ],
      ),
    );
  }
}