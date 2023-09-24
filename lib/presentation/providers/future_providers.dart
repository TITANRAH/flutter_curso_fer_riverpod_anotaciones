import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {
  // este es el provider de abajo
  final pokemonId = ref.watch(pokemonIdProvider);

  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  // obviamente si uso keepalive lo mantendra siempre vivo
  // y no lo destruira
  ref.onDispose(() {
    print('aqui se destruira el provider puedo realizar accioes');
  });

  // llamo a la peticion y la devuelvo
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() {
    return 1;
  }

  void nextPokemon() {
    state++;
  }

  void prevPokemon() {
    if (state > 1) {
      state--;
    }
  }
}

// family

// aqui no vuelve a jhacer la peticion mantiene data en cache
@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}
