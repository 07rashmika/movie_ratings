import 'package:flutter/material.dart';

import 'package:movie_ratings/models/movie.dart';
import 'package:movie_ratings/services/movie_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingAllFuture;
  final PageController _pageController = PageController(viewportFraction: .9);
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
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: 5,
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
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: _activePage == index ? 10 : 8,
                  width: _activePage == index ? 10 : 8,
                  decoration: BoxDecoration(
                    color: _activePage == index ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
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
