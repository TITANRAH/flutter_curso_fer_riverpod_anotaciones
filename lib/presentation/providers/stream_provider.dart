import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)
// async* esto es el regreso de string va con yield []
Stream<List<String>> userInChat(UserInChatRef ref) async* {
  final names = <String>[];

  // yield names;

  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }

  yield [];
}
