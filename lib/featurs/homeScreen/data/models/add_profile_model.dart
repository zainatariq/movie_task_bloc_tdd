



import '../../../../bases/pagination/model/pagination_api_model.dart';

class MovieResponse extends BaseResModel<List<Movie>> {
  List<Movie>? _data;

  MovieResponse(this._data,

      {


        super.status,
      });



  @override
   int get statusNumber => throw UnimplementedError();


// class MovieResponse {
//   int page;
//   List<Movie> results;
//   int totalPages;
//   int totalResults;
//
//   MovieResponse({
//     required this.page,
//     required this.results,
//     required this.totalPages,
//     required this.totalResults,
//   });
//
  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      json['results'] != null ? List<Movie>.from(json['results']?.map((x) => Movie.fromJson(x)) ?? []) : null,
      status: json["status"],

    );
  }

  @override
  // TODO: implement data
  List<Movie>? get data => _data;
}

class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  static const String baseUrl = 'https://image.tmdb.org/t/p/w500';

  String get posterUrl => posterPath != null ? '$baseUrl$posterPath' : '';

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
  toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

abstract class BaseResModel<T> {
  String? message;
  int? status;

  PaginationApiModel?  meta;

  BaseResModel({
    this.message,
    this.status,
    this.meta,
  });
  T? get data;
  int get statusNumber;


}
