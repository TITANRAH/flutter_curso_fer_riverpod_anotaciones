import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/movies_provider.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movies = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas'),
      ),
      body: movies.when(
        data: (movieList) {
          return ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];
              return Text(
                  'Película: $movie'); // Puedes personalizar este texto según tus necesidades.
            },
          );
        },
        loading: () =>
            const CircularProgressIndicator(), // Otra acción cuando está cargando.
        error: (error, stackTrace) =>
            Text('Error: $error'), // Manejo de errores.
      ),
    );
  }
}
