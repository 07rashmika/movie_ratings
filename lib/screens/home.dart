import 'package:flutter/material.dart';
import 'package:movie_ratings/models/movie.dart';
import 'package:movie_ratings/services/movie_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Declare the Future
  late Future<List<Movie>> trendingAllFuture;

  @override
  void initState() {
    super.initState();
    // 2. Create an instance of MovieApi to call the method
    trendingAllFuture = MovieApi().trendingAll(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Movies')),
      // 3. Use FutureBuilder to display the data
      body: FutureBuilder<List<Movie>>(
        future: trendingAllFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies found.'));
          }

          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.mediaType),
              );
            },
          );
        },
      ),
    );
  }
}

