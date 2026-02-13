class Movie {
  final int id;
  final String backdropPath;
  final String poster;
  final List<int> genres;
  final String language;
  final String title;
  final String description;
  final double popularity;
  final String releaseDate;
  final String mediaType;
  final double voteAverage;
  final int voteCount;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.poster,
    required this.genres,
    required this.language,
    required this.title,
    required this.description,
    required this.popularity,
    required this.releaseDate,
    required this.mediaType,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'].toInt(),
      backdropPath: map['backdrop_path'] ?? '',
      poster: map['poster_path'] ?? '',
      genres: List<int>.from(map['genre_ids'] ?? []),
      language: map['original_language'] ?? '',
      title: map['original_title'] ?? '',
      description: map['overview'] ?? '',
      popularity: (map['popularity'] ?? 0.0).toDouble(),
      releaseDate: map['release_date'] ?? '',
      mediaType: map['media_type'] ?? '',
      voteAverage: (map['vote_average'] ?? 0.0).toDouble(),
      voteCount: map['id'].toInt(),
    );
  }
}
