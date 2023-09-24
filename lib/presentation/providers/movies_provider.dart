import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/movies.dart';

part 'movies_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<dynamic>> movies(MoviesRef ref) async {
  final movies = await MovieInformation.getMovies();

  final List<dynamic> moviesList = [];

  moviesList.addAll(movies);
  return moviesList;
}
