import 'package:riverpod_annotation/riverpod_annotation.dart';

// colocamos el nombre del archivo que generara el codigo
// debo tener siempre el watch corriendo 
part 'hello_world_provider.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hola Mundo';
}
