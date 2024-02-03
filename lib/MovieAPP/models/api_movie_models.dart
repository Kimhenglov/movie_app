class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseData;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseData,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backDropPath"],
      originalTitle: json["originalTitle"],
      overview: json["overview"],
      posterPath: json["posterPath"],
      releaseData: json["releaseData"],
      voteAverage: json["voteAverage"],
    );
  }

  // Map<String, dynamic> toJson() =>{
  //   "title":title,
  //   "overview": overview,
  // };
}
