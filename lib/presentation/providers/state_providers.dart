import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

// riverpodclass y construye este codigo
// SI NECESITO MANTENER EL ESTADO VIVO USO @Riverpod(keepAlive: true)
// SI NO USO CON r
@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  build() {
    return 5;
  }

  void increaseByOne() {
    // simplemente puse state
    state++;
  }
}

@Riverpod(keepAlive: true)
class DarkMode extends _$DarkMode {
  @override
  build() {
    return false;
  }

  void toggleDarkMode() {
    state = !state;
  }
}

@Riverpod(keepAlive: true)
class NameAleatorio extends _$NameAleatorio {
  @override
  build() {
    return 'Sergio Miranda';
  }

  void changeName(String name) {
    state = name;
  }
}




//darkmode -> bool


