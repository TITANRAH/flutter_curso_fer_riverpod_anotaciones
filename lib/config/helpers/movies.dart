import 'package:dio/dio.dart';

class MovieInformation {
  static Future<List<dynamic>> getMovies() async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=9a9353e2834fee82f45e99afe711cd6c&language=es-MX');

      
      return response.data['results'];
    } catch (e) {
      return [];
    }
  }
}
