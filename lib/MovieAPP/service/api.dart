import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pp/MovieAPP/models/api_movie_models.dart';
import 'package:pp/MovieAPP/service/constants.dart';

class API {
  static const _trendURL =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";

  Future<List<Movie>> getTrendingMovie() async {
    final response = await http.get(Uri.parse(_trendURL));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['result'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
}
