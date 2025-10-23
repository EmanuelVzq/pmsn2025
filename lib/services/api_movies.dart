import 'package:dio/dio.dart';
import 'package:pmsn2025/models/api_movie_dao.dart';

class ApiMovies {
  final dio = Dio();

  Future<List<ApiMovieDao>>getMovies() async{
    final URL = "https://api.themoviedb.org/3/movie/popular?api_key=7e9ea2fd5ca396a3d5b86b45e0f7920b"; 
    final response = await dio.get(URL);
    final res = response.data['results'] as List;
    return res.map((movie) => ApiMovieDao.fromMap(movie)).toList();
  }
}
//diferencia entre dio y http es que dio tiene cache y puedes configurar el cache