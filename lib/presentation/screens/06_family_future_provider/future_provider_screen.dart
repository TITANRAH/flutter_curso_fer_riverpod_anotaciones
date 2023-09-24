import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    // cuando es asuyncvalue usar when
    // este es el pokemon provider y debo cambiar el statefulwidget al 
    // consumer statefullwidget 
    // EL FamilyFutureScreenState
    // Y ConsumerState

    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon id: $pokemonId'),
        ),
        body: Center(
          child: pokemonAsync.when(
              data: (data) => Text(data),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator()),
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
                pokemonId++;
                setState(() {});

                // ref.read(pokemonIdProvider.notifier).nextPokemon();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                if (pokemonId <= 1) return;
                pokemonId--;
                setState(() {});
                // ref.read(pokemonIdProvider.notifier).prevPokemon();
              },
            ),
          ],
        ));
  }
}
