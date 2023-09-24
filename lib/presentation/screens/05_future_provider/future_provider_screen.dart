import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonName = ref.watch(pokemonNameProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: Center(
          // aqui llamo al future provider por eso puedo usar when 
          // y este future provider depende del provider pokemonId 
          // en el mismo archivo de providernAME
          child: pokemonName.when(
            data: (data) => Text(data),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              // si no pongo esto al tener 2 botones de floating dara problemas
              // casi no se usa tener 2 floating pero para el ejemplop sirve
              heroTag: 'btn-1',
              child: const Icon(Icons.exposure_plus_1),
              onPressed: () {
                // aqui llamo siempre con read en onpress a la lectura solamente del 
                // next pokemon en el provider de pokemonid
                ref.read(pokemonIdProvider.notifier).nextPokemon();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                ref.read(pokemonIdProvider.notifier).prevPokemon();
              },
            ),
          ],
        ));
  }
}
