import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_ratings/models/movie.dart';
import 'package:movie_ratings/services/movie_api.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  late Future<List<Movie>> trendingAllFuture;
  final PageController _pageController = PageController(viewportFraction: 1);
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    trendingAllFuture = MovieApi().trendingAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: trendingAllFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Movies cannot be loaded!!!'));
        }

        final trendingMovies = snapshot.data!;

        return Column(
          children: [
            SizedBox(
              width: .infinity,
              height: 500,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: trendingMovies.length,
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _activePage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${trendingMovies[index].poster}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey,
                                child: const Icon(Icons.movie),
                              ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Trending',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: .w500,
                              ),
                            ),
                            Text(
                              '🔥',
                              style: GoogleFonts.notoColorEmoji(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          trendingMovies[_activePage].title,
                          style: TextStyle(fontSize: 36, fontWeight: .w600),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(trendingMovies[_activePage].releaseDate),
                            const SizedBox(width: 8),
                            Container(
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Text(trendingMovies[_activePage].language),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 5),
                        Text(
                          trendingMovies[_activePage].voteAverage
                              .toStringAsFixed(1),
                          style: TextStyle(color: Colors.amber),
                        ),
                        Text(
                          '(${trendingMovies[_activePage].voteCount.toString()})',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: .center,
              children: List.generate(
                trendingMovies.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: _activePage == index ? 10 : 8,
                  width: _activePage == index ? 10 : 8,
                  decoration: BoxDecoration(
                    color: _activePage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    borderRadius: .circular(50),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
