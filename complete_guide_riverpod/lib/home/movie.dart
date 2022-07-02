import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String title;
  String posterPath;

  Movie({
    required this.title,
    required this.posterPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      // underscore path!
      'poster_path': posterPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      posterPath: map['poster_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';
}
