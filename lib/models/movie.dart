class Movie {
  final int tmdbId;
  final double averageRating;
  final String backdropPoster;
  final String poster;
  final List<String> genres;
  final String language;
  final String title;
  final String description;
  final double popularity;
  final String releaseDate;
  final int runtime;
  final String status;
  final String mediaType;

  const Movie({
    required this.tmdbId,
    required this.averageRating,
    required this.backdropPoster,
    required this.poster,
    required this.genres,
    required this.language,
    required this.title,
    required this.description,
    required this.mediaType,
    required this.popularity,
    required this.releaseDate,
    required this.runtime,
    required this.status,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    final ratings = map['ratings'] as Map<String, dynamic>?;
    final media = map['media'] as Map<String, dynamic>?;

    return Movie(
      tmdbId: map['tmdbId'],
      averageRating: (ratings?['average']?['score'] ?? 0.0).toDouble(),
      backdropPoster: (media?['backdrop_path'] ?? ''),
      poster: (media?['poster_path'] ?? ''),
      genres: (media?['genres'] as List? ?? [])
          .map((g) => g['name'].toString())
          .toList(),
      language: (media?['original_language'] ?? ''),
      title: (media?['title'] ?? ''),
      description: (media?['overview'] ?? ''),
      mediaType: (media?['media_type'] ?? ''),
      popularity: (media?['popularity'] ?? 0.0).toDouble(),
      releaseDate: (media?['release_date'] ?? ''),
      runtime: (media?['runtime'] ?? 0),
      status: (media?['status'] ?? ''),
    );
  }
}
